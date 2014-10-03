#= require jquery
#= require characters

ROSTER_BOX_WIDTH = 71
ROSTER_BOX_HEIGHT = 30
ROSTER_BOX_VERTICAL_SEP = 0
ROSTER_BOX_HORIZONTAL_SEP = 5

class Game
  randomizeCharacters: ->
    @selectedCharacters = []

    for [1..4]
      loop
        character = CHARACTERS.getRandom()
        break unless character in @selectedCharacters

      @selectedCharacters.push(character)

  printCharacters: ->
    for character, index in @selectedCharacters
      position = CHARACTERS.indexOf(character) + 1
      row = Math.ceil(position / 4)
      col = position % 4
      col = 4 if col == 0

      row -= 1
      col -= 1

      top = row * ROSTER_BOX_HEIGHT + row * ROSTER_BOX_VERTICAL_SEP + 1
      left = col * ROSTER_BOX_WIDTH + col * ROSTER_BOX_HORIZONTAL_SEP + 3

      $(".roster-selection.p#{index + 1}").css(top: "#{top}px", left: "#{left}px")

  start: ->
    @randomizeCharacters()
    @printCharacters()

$ ->
  @game = new Game
  @game.start()
