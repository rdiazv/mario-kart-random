#= require jquery
#= require characters
#= require vehicles

ROSTER_BOX_WIDTH = 71
ROSTER_BOX_HEIGHT = 30
ROSTER_BOX_VERTICAL_SEP = 0
ROSTER_BOX_HORIZONTAL_SEP = 5

class Game
  randomizeCharacters: ->
    @players = []
    selected = []

    for [1..4]
      loop
        character = CHARACTERS.getRandom()
        break unless character in selected

      selected.push character
      @players.push
        character: character
        vehicle: VEHICLES[character.type].getRandom()

  printCharacters: ->
    for player, index in @players
      position = CHARACTERS.indexOf(player.character) + 1
      row = Math.ceil(position / 4)
      col = position % 4
      col = 4 if col == 0

      row -= 1
      col -= 1

      top = row * ROSTER_BOX_HEIGHT + row * ROSTER_BOX_VERTICAL_SEP + 1
      left = col * ROSTER_BOX_WIDTH + col * ROSTER_BOX_HORIZONTAL_SEP + 3

      $(".roster-selection.p#{index + 1}").css(top: "#{top}px", left: "#{left}px")

      $(".character.p#{index + 1}")
        .find(".image").html("""<img src="#{player.character.image}" class="img-responsive" />""").end()
        .find(".name").text(player.character.name).end()
        .find(".vehicle").text(player.vehicle.name)

  cleanupTracks: ->
    $(".tournament").removeClass("selected")
      .find(".selected").removeClass("selected")
      .find(".badge").remove()

  randomizeTracks: ->
    selected = []

    for index in [1..4]
      loop
        track = Math.floor(Math.random() * 32)
        break unless track in selected

      selected.push track

      $(".track:eq(#{track})").addClass("selected")
        .prepend("""<span class="badge">#{index}</span>""")
        .closest(".tournament").addClass("selected")

  randomize: ->
    @randomizeCharacters()
    @cleanupTracks()
    @randomizeTracks()
    @printCharacters()

$ ->
  game = new Game
  game.randomize()

  $("[data-new-game]").on "click", ->
    game.randomize()
