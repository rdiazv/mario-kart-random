#= require core_ext/array
#= require lib/game

$ ->
  game = new Game

  $("[data-new-game]").on "click", ->
    game.randomize()

    $(this).prop(disabled: not game.hasMoreTracks())
    $("[data-new-session]").prop(disabled: false)

  $("[data-new-session]").on "click", ->
    game.resetTracks()
    $("[data-new-game]").prop(disabled: false)
    $(this).prop(disabled: true)
