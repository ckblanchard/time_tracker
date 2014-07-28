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




# window.Entry = class Entry
#   @entryDate: null
#   @startTime: null
#   @endTime: null

#   constructor: (entryDate) ->
#     @entryDate = (+new Date() / 1000) unless entryDate?
#     @startTime = entryDate

#   setEndTime ->
#     @endTime = -> +new Date() / 1000



# window.Entry = class Entry
#   @end_time: null

#   constructor: (entry_date = (+new Date() / 1000)) ->
#     @entry_date = entry_date
#     @start_time = entry_date

#   endTime: ->
#     @end_time = -> +new Date() / 1000
#     