# class EventsCalendar
#   @create: (dates) ->
#     @getDates().done (dates) ->
      

#   createDatePicker: ->
#     @el.glDatePicker
#       selectable

#   getDates: ->
#     $.ajax
#       url: '/events/dates.json'

parseCurrentDate = ->
  parts = window.location.pathname.split('/')
  date = new Date(parts[parts.length-1]) 
  if date.toString() == 'Invalid Date'
    new Date()
  else
    date

$(document).ready ->
  request = $.get('/events/dates.json')
  request.done (dates) ->
    $('.events-calendar div').glDatePicker
      showAlways: true
      selectedDate: parseCurrentDate()
      selectableDates: dates.map (date) -> { date: new Date(date) }
      onClick: (el, cell, date) ->
        day   = ('0' + date.getDate()).slice(-2)
        month = ('0' + (date.getMonth()+1)).slice(-2)
        year  = date.getFullYear()
        window.location.pathname = "/events/#{year}-#{month}-#{day}"
