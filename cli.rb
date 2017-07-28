module FinalCafe
  require 'io/console'
  require 'terminal-table'
  require 'RMagick'
  require 'tco'

  class Cli
    attr_reader :menu, :run

    def initialize
      @menu_choice = nil
      @menu        = :home
      @last_menu   = :home
      @run         = true
    end

    def cursor(flag, *p)
      code = case flag
        when :hide then '?25l' # Hide cursor
        when :show then '?25h' # Show cursor
        when :move then "#{p[0]};#{p[1]}H" # Move cursor to row & col
      end
      $stdout.write"\e[#{code}"
    end
    
    private def render_panel(content, flag)
      Terminal::Table::Style.defaults = { width: 81 }
      panel = Terminal::Table.new do |row|
        row.rows = content
        apply_border(row, flag)
      end
      panel.align_column(0, :center) if flag != 'prompt'
      puts panel
    end

    private def apply_border(row, flag)
      if [:menu].include? flag
        row.style = { border_top: false, border_bottom: false }
      end
    end

    def print_cli
      system 'clear'
      render_panel(CLI_HEADER, :header)
      render_image('burger.png')
      render_panel(CLI_HOME, :home)
    end

    def render_image(image_path)
      cursor(:move, 15, 2)
      img = Magick::Image.read(image_path).first
      img.each_pixel do |pixel, col|
        c = [pixel.red, pixel.green, pixel.blue].map do |v|
          256 * (v / 65_535.0)
        end
        pixel.opacity == 65_535 ? print('  ') : print('  '.bg c)
        puts if col >= img.columns - 1
      end 
    end

    def next_menu
    end

    def get_choice(menu_type)
      valid_choice = false
      options = valid_options(menu_type)
      until valid_choice
        choice = STDIN.getch
        valid_choice = true if options.include? choice
      end
      @menu_choice = choice
    end

    def valid_options(menu_type)
      options = case menu_type
                when :home then CLI_HOME
                when :food then CLI_FOOD
                when :drinks then DRINKS_MENU
                end
      define_options(options)
    end

    private def define_options(options)
      [*1..options.length].map(&:to_s).push(*['x', 'X'])
    end
  end
end
