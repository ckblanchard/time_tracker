jQuery ->
  entry = new Entry
  timer = $('.timer')
  startButton = $('.start-button')
  stopButton = $('.stop-button')
  now = null
  offset = null
  clock = null
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
    

  stopButton.click ->
    entry.setEndTime()
    clearInterval window._timerInterval
    console.log entry.properties.endTime
    stopButton.prop('disabled', true)
    timer.removeClass('active').addClass('done')
    _finalTime()

  _startTimer = ->
    console.log "clicked start"    
    window._timerInterval = setInterval _counter, 1000

  _counter = () ->
    count++
    console.log "hit _counter function, count: #{count}"
    timer.html(count)

  _finalTime = () ->
    finalTime = entry.properties.endTime - entry.properties.startTime
    timer.html(finalTime.toFixed())