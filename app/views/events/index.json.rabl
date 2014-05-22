collection @events
attributes :id, :name, :description, :start, :finish, :all_day

node(:title)   { |event| event.name                 }
node(:start)   { |event| event.start.to_s(:rfc822)  }
node(:end)     { |event| event.finish.to_s(:rfc822) }
node(:url)     { |event| edit_event_url(event)      }
node(:allDay)  { |event| event.all_day              }

node(:color) do |event|
  event.start - 3.days < Time.now ? '#920202' : '#00AEEF'
end

node(:update) { |event| event_url(event) }
