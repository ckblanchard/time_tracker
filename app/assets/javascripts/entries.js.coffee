window.Entry = class Entry
  constructor: ->
    @properties=
      entryDate: +new Date() / 1000
      startTime: null
      endTime: null

  setStartTime: (time=(+new Date() / 1000)) ->
    @properties.startTime = time
    this

  setEndTime: (time=(+new Date() / 1000)) ->
    @properties.endTime = time
    this

jQuery ->
  entry = new Entry
  timer = $('.timer')
  startButton = $('.start-button')
  stopButton = $('.stop-button')
  clock = 0
  count = 0
  finalTime = null

  _initialize = () ->
    stopButton.prop('disabled', true)

  _initialize()

  startButton.click ->
    entry.setStartTime()
    console.log entry.properties.startTime
    _startTimer()
    startButton.prop('disabled', true)
    stopButton.prop('disabled', false)
    $("#entry_start_time").val(entry.properties.startTime)
    $("#entry_entry_date").val(entry.properties.entryDate)
    
  stopButton.click ->
    entry.setEndTime()
    clearInterval window._timerInterval
    console.log entry.properties.endTime
    stopButton.prop('disabled', true)
    timer.removeClass('active').addClass('done')
    timer.html(clock)
    $("#entry_end_time").val(entry.properties.endTime)

  _startTimer = ->
    console.log "clicked start"    
    window._timerInterval = setInterval _counter, 1000

  _counter = () ->
    count++
    console.log "hit _counter function, count: #{count}"
    clock = _calculate_clock(count)
    timer.html(clock)

  _calculate_clock = (count) ->
    hours = Math.floor(count / 3600)
    minutes = Math.floor((count - (hours * 3600)) / 60)
    seconds = (count - (hours * 3600) - (minutes * 60)).toFixed()
    if hours < 10 then hours = "0#{hours}"
    if minutes < 10 then minutes = "0#{minutes}"
    if seconds < 10 then seconds = "0#{seconds}"
    clock = "#{hours}:#{minutes}:#{seconds}"