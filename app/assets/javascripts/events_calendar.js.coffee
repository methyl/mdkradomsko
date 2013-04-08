# class EventsCalendar
#   @create: (dates) ->
#     @getDates().done (dates) ->
      

#   createDatePicker: ->
#     @el.glDatePicker
#       selectable

#   getDates: ->
#     $.ajax
#       url: '/events/dates.json'

$(document).ready ->
  request = $.get('/events/dates.json')
  request.done (dates) ->
    $('.events-calendar div').glDatePicker
      showAlways: true
      selectableDates: dates.map (date) -> { date: new Date(date) }
      onClick: (el, cell, date) ->
        day   = ('0' + date.getDate()).slice(-2)
        month = ('0' + (date.getMonth()+1)).slice(-2)
        year  = date.getFullYear()
        window.location.href = "/events/#{year}-#{month}-#{day}"