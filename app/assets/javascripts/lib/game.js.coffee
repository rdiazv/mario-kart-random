class @Game
  ROSTER_WIDTH = 71
  ROSTER_HEIGHT = 30
  ROSTER_VERT_SEP = 0
  ROSTER_HORI_SEP = 5
  ROSTER_VERT_OFFSET = 1
  ROSTER_HORI_OFFSET = 3
  ROSTER_COLUMNS = 4
  TRACKS_NUMBER = 32

  constructor: ->
    @_printNonAvailableCharacters()
    @_alreadyPlayedCourses = []

  randomize: ->
    @_randomizeCharacters()
    @_randomizeTracks()
    @_printCharacters()

  hasMoreTracks: ->
    @_alreadyPlayedCourses.length < TRACKS_NUMBER

  resetTracks: ->
    @_alreadyPlayedCourses = []

  _randomizeCharacters: ->
    @players = []

    for character in gon.config.characters.getDistinctRandom(4, (value) -> value.unlocked)
      @players.push
        character: character
        vehicle: _.filter(gon.config.vehicles, (vehicle) -> vehicle.type == character.type).getRandom (value) -> value.unlocked

  _getCharacterRosterOffset: (character) ->
    position = gon.config.characters.indexOf(character) + 1
    row = Math.ceil(position / ROSTER_COLUMNS)
    col = position % ROSTER_COLUMNS
    col = ROSTER_COLUMNS if col == 0

    row -= 1
    col -= 1

    top: row * ROSTER_HEIGHT + row * ROSTER_VERT_SEP + ROSTER_VERT_OFFSET
    left: col * ROSTER_WIDTH + col * ROSTER_HORI_SEP + ROSTER_HORI_OFFSET

  _selectRoster: (character, playerNumber) ->
    rosterOffset = @_getCharacterRosterOffset(character)
    $(".roster-selection.p#{playerNumber}").show().css(rosterOffset)

  _printNonAvailableCharacters: ->
    for character, index in gon.config.characters
      continue if character.unlocked
      rosterOffset = @_getCharacterRosterOffset(character)
      $("""<div class="roster-selection non-available"></div>""").appendTo('.roster').show().css(rosterOffset)

  _printCharacter: (player, playerNumber) ->
    image = "<img src='#{player.character.image}' class='img-responsive' />"

    $(".character.p#{playerNumber}")
      .find(".image").html(image).end()
      .find(".name").text(player.character.name).end()
      .find(".vehicle").text(player.vehicle.name)

  _printCharacters: ->
    for player, index in @players
      @_printCharacter(player, index + 1)
      @_selectRoster(player.character, index + 1)

  _selectTrack: (track, number) ->
    $(".track:eq(#{track})").addClass("selected")
      .prepend("""<span class="badge">#{number}</span>""")
      .closest(".tournament").addClass("selected")

  _randomizeTracks: ->
    $(".tournaments .selected").removeClass("selected").find(".badge").remove()

    tracks = [0...TRACKS_NUMBER].getDistinctRandom 4, (value) =>
      value not in @_alreadyPlayedCourses

    for track, index in tracks
      @_alreadyPlayedCourses.push(track)
      @_selectTrack(track, index + 1)
