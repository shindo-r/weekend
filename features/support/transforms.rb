#base
Transform /^table:.*$/ do |table|
  table.headers.each do |header|
    table.map_column!(header) { |value| Transform(value) }
  end
  table
end
Transform /\[.*\]/ do |str|
  str.gsub(/\[([^\[\]]*)\]/) {|match| Transform($1)}
end

#date
Transform /^(?:tomorrow|today)$/ do |str|
  Date.send(str)
end
Transform /^(-?\d+) days ((?:ago|since))$/ do |num, ago_or_since|
  num.to_i.days.send(ago_or_since)
end

#date format
Transform /^(.*)\((.*)\)$/ do |value, format|
  transformed_value = Transform(value)
  case format
  when /^MM\/DD$/
    transformed_value.strftime('%m/%d')
  end
end
