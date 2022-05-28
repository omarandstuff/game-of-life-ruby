# frozen_string_literal: true
require_relative "game_of_life/version"
require_relative "game_of_life/base_runner"
require_relative "game_of_life/board"
require_relative "game_of_life/terminal_runner"

module GameOfLife
  class Error < StandardError; end
end
