module FinalCafe
  require 'artii'
  require 'pastel'

  PASTEL = Pastel.new

  TITLE_ART = Artii::Base.new font: 'slant'

  CLI_HEADER = [
    [TITLE_ART.asciify('THE FINAL')],
    [TITLE_ART.asciify('CAFE')]
  ].freeze

  CLI_HOME = [
    ["\n" + PASTEL.green.bold('1 ') + 'Show Food Menu  '],
    [PASTEL.green.bold('2 ') + 'Show Drinks Menu'],
    [PASTEL.green.bold('3 ') + 'Order Items     '],
    [PASTEL.green.bold('4 ') + 'Ask for bill    '],
    [PASTEL.red.bold('X ') + "Quit            \n "]
  ].freeze

  CLI_FOOD = [
    ["\n" + PASTEL.green.bold('1 ') + 'Entree          '],
    [PASTEL.green.bold('2 ') + 'Main            '],
    [PASTEL.green.bold('3 ') + 'Desert          '],
    [PASTEL.red.bold('X ') + "Back            \n "]
  ].freeze

  CLI_DRINK = [
    ["\n" + PASTEL.green.bold('1 ') + 'Non-alcoholic   '],
    [PASTEL.green.bold('2 ') + 'Alcoholic       '],
    [PASTEL.red.bold('X ') + "Back            \n "]
  ].freeze

  CLI_ORDER = [
    ["\n" + PASTEL.bold("Select an option from the menu to order.\n")]
  ]

  CLI_IMAGE = './coffee.png'
end
