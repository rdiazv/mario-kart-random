#= require core_ext/array
#= require lib/game

$ ->
  game = new Game

  $("[data-new-game]").on "click", -> game.randomize()
