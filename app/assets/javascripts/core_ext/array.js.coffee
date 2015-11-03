Array::getRandom = (condition) ->
  return null if @countMatchesCondition(condition) == 0

  loop
    value = @[Math.floor(Math.random() * @length)]
    break if not condition? or condition(value)

  value

Array::getDistinctRandom = (number, condition) ->
  values = []

  return [] if @countMatchesCondition(condition) == 0

  for [1..Math.min(number, @length)]
    loop
      value = @getRandom(condition)
      break unless value in values

    values.push(value)

  values

Array::countMatchesCondition = (condition) ->
  matches = 0

  for value in this
    matches += 1 if condition(value)

  matches
