Array::getRandom = ->
  @[Math.floor(Math.random() * @length)]

Array::getDistinctRandom = (number, condition) ->
  values = []

  for [1..Math.min(number, @length)]
    loop
      value = @getRandom()
      break if not (value in values) and (not condition? or condition(value))

    values.push(value)

  values
