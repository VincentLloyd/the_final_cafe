require_relative 'order'
require_relative 'menu'
require_relative 'cli'
require_relative 'content'

cli = FinalCafe::Cli.new
order = Order.new

cli.print_cli
while cli.run
  cli.get_choice(cli.menu)
end

loop do
  puts 'What would you like?'
  choice = gets.chomp
  # Stop looping if user pressed just enter
  break if choice == ""

  # User must choose an index number
  user_index = choice.to_i

  # If the user entered in an invalid choice
  if user_index == 0
    "Invalid choice, please try again"
    next # Loop through and ask again
  end

  index = user_index - 1 # Convert to zero-based index
  menu_item = MENU_ITEMS[index]

  # Add item to order
  order << menu_item
end

puts 'Thank you'
puts ''

sleep 2
puts 'I hope you enjoyed your meal. Here is your bill:'
puts order.bill
