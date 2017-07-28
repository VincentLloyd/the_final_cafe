module FinalCafe
  class MenuItem
    attr_accessor :name, :price

    def initialize(name, price)
      @name = name
      @price = price
    end
  end

  class Menu
    FOOD_ENTREE = [
      MenuItem.new('Oysters', 13),
      MenuItem.new('Parma', 15),
      MenuItem.new('Eggplant Casserole', 15),
      MenuItem.new('Chips', 7),
      MenuItem.new('Beer', 7),
      MenuItem.new('Soft drink', 3.50)
    ]

    FOOD_MAIN = [
      MenuItem.new('Steak', 20),
      MenuItem.new('Parma', 15),
      MenuItem.new('Eggplant Casserole', 15),
      MenuItem.new('Chips', 7),
      MenuItem.new('Beer', 7),
      MenuItem.new('Soft drink', 3.50)
    ]

    FOOD_DESERT = [
      MenuItem.new('Ice Cream', 7),
      MenuItem.new('Pavlova', 8),
      MenuItem.new('Sticky Date Pudding', 8),
      MenuItem.new('Cheescake', 7),
      MenuItem.new('Cheese platter', 13),
      MenuItem.new('Soft drink', 3.50)
    ]

    DRINKS = [
      MenuItem.new('Ice Cream', 7),
      MenuItem.new('Pavlova', 8),
      MenuItem.new('Sticky Date Pudding', 8),
      MenuItem.new('Cheescake', 7),
      MenuItem.new('Cheese platter', 13),
      MenuItem.new('Soft drink', 3.50)
    ]

    def initialize
      @entree  = build_menu(FOOD_ENTREE)
      @main    = build_menu(FOOD_MAIN)
      @dessert = build_menu(FOOD_DESSERT)
      @drinks  = build_menu(DRINKS)
    end

    def build_menu(items)
      item_array = []
      items.each { |menu_item| item_array << menu_item }
    end
  end
end
