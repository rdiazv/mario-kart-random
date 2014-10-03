@CHARACTERS = [
  {
    name: "Baby Mario",
    type: "small",
    unlocked: true
  },
  {
    name: "Baby Luigi",
    type: "small",
    unlocked: true
  },
  {
    name: "Baby Peach",
    type: "small",
    unlocked: true
  },
  {
    name: "Baby Daisy",
    type: "small",
    unlocked: true
  },
  {
    name: "Toad",
    type: "small",
    unlocked: true
  },
  {
    name: "Toadette",
    type: "small",
    unlocked: false
  },
  {
    name: "Koopa Troopa",
    type: "small",
    unlocked: true
  },
  {
    name: "Dry Bones",
    type: "small",
    unlocked: true
  },
  {
    name: "Mario",
    type: "medium",
    unlocked: true
  },
  {
    name: "Luigi",
    type: "medium",
    unlocked: true
  },
  {
    name: "Peach",
    type: "medium",
    unlocked: true
  },
  {
    name: "Daisy",
    type: "medium",
    unlocked: true
  },
  {
    name: "Yoshi",
    type: "medium",
    unlocked: true
  },
  {
    name: "Birdo",
    type: "medium",
    unlocked: true
  },
  {
    name: "Diddy Kong",
    type: "medium",
    unlocked: true
  },
  {
    name: "Bowser Jr.",
    type: "medium",
    unlocked: true
  },
  {
    name: "Wario",
    type: "large",
    unlocked: true
  },
  {
    name: "Waluigi",
    type: "large",
    unlocked: true
  },
  {
    name: "Donkey Kong",
    type: "large",
    unlocked: true
  },
  {
    name: "Bowser",
    type: "large",
    unlocked: true
  },
  {
    name: "King Boo",
    type: "large",
    unlocked: true
  },
  {
    name: "Rosalina",
    type: "large",
    unlocked: true
  },
  {
    name: "Funky Kong",
    type: "large",
    unlocked: true
  },
  {
    name: "Dry Bowser",
    type: "large",
    unlocked: false
  }
]

@CHARACTERS.getRandom = ->
  loop
    character = @[Math.floor(Math.random() * @length)]
    break if character.unlocked

  character
