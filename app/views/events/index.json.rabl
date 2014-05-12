collection @events
attributes :id, :name, :description, :start, :finish

node(:title)   { |event| event.name }
node(:start)   { |event| event.start }
node(:end)     { |event| event.finish }
node(:url)     { |event| edit_event_url(event) }

node(:color) do |event|
  event.start - 3.days < Time.now ? '#920202' : '#00AEEF'
end
