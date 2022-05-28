# frozen_string_literal: true
require 'io/console'

class GameOfLife::TerminalRunner < GameOfLife::BaseRunner
  protected

  def before_running
    trap("SIGINT") do
      @stopping = true
    end
  end

  def process_board_buffer
    system('clear')
    
    buffer = @board.as_buffer

    for y in 0..@board.height
      for x in 0...@board.width
        current_index = y * @board.width + x
        currently_value = buffer[current_index]

        if currently_value
          print '▓'
        else
          print ' '
        end
      end
      print "\n"
    end
  end

  def get_runner_width
    IO.console.winsize[1]
  end

  def get_runner_height
    IO.console.winsize[0] - 2
  end
end