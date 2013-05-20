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
  path = window.location.pathname
  exp = /\d{4}-\d{2}-\d{2}/
  if path.match(exp)
    new Date(path.match(exp)[0])
  else
    new Date()

setLocationDate = (date) ->
  exp = /\d{4}-\d{2}-\d{2}/
  if window.location.pathname.match(exp)
    path =  window.location.pathname.replace(exp, date)
  else
    path = window.location.pathname += '/' + date
  window.location.pathname = path.replace('today/', '').replace('soon/', '')

getDatesPath = ->
  path = '/events/'
  path += window.event_type + '/' if window.event_type
  path += 'dates'
  path += '/archive' if window.location.pathname.match('archive')
  path += '.json'
  path

$(document).ready ->
  request = $.get(getDatesPath())
  request.done (dates) ->
    $('.events-calendar div').glDatePicker
      showAlways: true
      selectedDate: parseCurrentDate()
      selectableDates: dates.map (date) -> { date: new Date(date) }
      onClick: (el, cell, date) ->
        day   = ('0' + date.getDate()).slice(-2)
        month = ('0' + (date.getMonth()+1)).slice(-2)
        year  = date.getFullYear()
        setLocationDate("#{year}-#{month}-#{day}")
        # if window.location.pathname.match('archive')
        #   window.location.pathname = "/events/archive/#{year}-#{month}-#{day}"
        # else
        #   window.location.pathname = "/events/#{year}-#{month}-#{day}"
