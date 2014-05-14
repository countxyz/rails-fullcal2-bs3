collection @events
attributes :id, :name, :description, :start, :finish, :all_day

node(:title)   { |event| event.name }
node(:start)   { |event| event.start.strftime('%Y-%m-%dT%R') unless event.start.nil?  }
node(:end)     { |event| event.finish.strftime('%Y-%m-%dT%R') unless event.finish.nil? }
node(:url)     { |event| edit_event_url(event) }
node(:allDay)  { |event| event.all_day }

node(:color) do |event|
  event.start - 3.days < Time.now ? '#920202' : '#00AEEF'
end

node(:update) { |event| event_url(event) }
