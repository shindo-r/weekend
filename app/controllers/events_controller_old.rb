# -*- encoding: UTF-8 -*-
require 'rexml/document'
require 'open-uri'
require 'nkf'
require "rexml/document"

# 参考URL
# 緯度経度の取得
#   http://www.geocoding.jp/api/
# XMLパース
#   http://www.germane-software.com/software/rexml/docs/tutorial.html

class EventsControllerOld < ApplicationController
  # 距離限界
  # 　緯度経度から計算された距離が以下の数値を超えたら表示しない
  DISTANCE_LIMIT = 0.35

  def index
    # 自宅の緯度、軽度を取得
    home_address = URI.encode('東京都品川区西品川2-23-5')
    puts 'http://www.geocoding.jp/api/?q='+home_address
    home_geo_xml = REXML::Document.new open('http://www.geocoding.jp/api/?q='+home_address)
    home_lat =  home_geo_xml.root.elements["coordinate/lat"].text.to_f
    home_lon =  home_geo_xml.root.elements["coordinate/lng"].text.to_f

    # イベントの取得
    @events = []
    url = 'http://api.atnd.org/events/?'
    i = 1
    loop do
      term = (Date.today..Date.today.next_month).to_a.select{|d| d.wday == 0 or d.wday == 6 }
      param = {
        :ymd => term.map{|d| d.strftime("%Y%m%d") }.join(','),
        :count => 100,
        :start => i
      }
      result = open(url + param.map{|k,v| "#{k}=#{v}" }.join('&'))
      xml = REXML::Document.new result
      event_elements = xml.root.elements["events"].select{|e| not e.to_s.blank?}
      
      break if event_elements.empty?
      i+= 100
      
      event_elements.each do |e|
        event = Event.new
        event.event_id = e.elements["event_id"].text
        event.event_url = e.elements["event_url"].text
        event.title = e.elements["title"].text
        event.address = e.elements["address"].text
        event.started_at = e.elements["started_at"].text.try :to_time
        event.ended_at = e.elements["ended_at"].text.try :to_time
        event.updated_at = e.elements["updated_at"].text.try :to_time
        event.lat = e.elements["lat"].text.try :to_f
        event.lon = e.elements["lon"].text.try :to_f
        if area_of_activity?(home_lat, home_lon, event) and
           no_longer_than(7,event) then 
           
          @events << event 
        end
      end
      
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  private 
  
  def no_longer_than(day, event)
    event.ended_at.blank? or (event.ended_at.to_date-event.started_at.to_date).to_i < day 
  end
  
  def area_of_activity?(home_lat, home_lon, event)
    return false if event.lat.blank? or event.lon.blank? 
    DISTANCE_LIMIT > Math.sqrt((home_lat-event.lat)**2 + (home_lon-event.lon)**2)
  end
end
