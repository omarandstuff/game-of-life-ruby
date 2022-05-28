require_relative '../lib/game_of_life'

runner = GameOfLife::TerminalRunner.new(speed: 10)
runner.board.set_random
runner.run
