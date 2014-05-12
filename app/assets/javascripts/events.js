$(document).on('page:change', function() {
  $('#calendar').fullCalendar({
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
    height: 600,
    editable: true,
    events: '/events',
    eventRender: function(event, element) {
      $('a').attr('data-remote', true);
    }
  });
});
