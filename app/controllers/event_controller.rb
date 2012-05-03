class EventController < ApplicationController

  def index
    @events = Event.all

#    @events = Event.between(4.week.since,2.week.since).weekend
  end

end
