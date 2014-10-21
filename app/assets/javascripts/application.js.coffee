#= require jquery
#= require core_ext/array
#= require db/characters
#= require db/vehicles
#= require lib/game

$ ->
  game = new Game
  $("[data-new-game]").on "click", -> game.randomize()
