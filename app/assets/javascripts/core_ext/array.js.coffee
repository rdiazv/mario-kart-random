Array::getRandom = (condition) ->
  loop
    value = @[Math.floor(Math.random() * @length)]
    break if not condition? or condition(value)

  value

Array::getDistinctRandom = (number, condition) ->
  values = []

  for [1..Math.min(number, @length)]
    loop
      value = @getRandom(condition)
      break unless value in values

    values.push(value)

  values
