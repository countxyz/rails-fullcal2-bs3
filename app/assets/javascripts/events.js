function resize(event, dayDelta, minuteDelta){
  $.ajax({
    type: 'PUT',
    dataType: 'script',
    url: event.update,
    contentType: 'application/json',
    data: JSON.stringify({
      event: { id: event.id, finish: event.end + minuteDelta + dayDelta },
      _method:'put'
    })
  });
}

$(document).on('page:change', function() {
  $('#calendar').fullCalendar({
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
    height: 600,
    editable: true,
    resizable: true,
    timezone: true,
    events: '/events',
    eventRender: function(event, element) {
      $('a').attr('data-remote', true);
    },
    eventResize: function(event, dayDelta, minuteDelta, revertFunc) {
      resize(event, dayDelta, minuteDelta);
    }
  });
});
