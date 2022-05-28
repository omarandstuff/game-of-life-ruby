# frozen_string_literal: true

class GameOfLife::BaseRunner
  attr_reader :board
  attr_reader :speed

  def initialize(speed: 1, board: nil)
    @board = board || GameOfLife::Board.new(width: get_runner_width, height: get_runner_height)
    @speed = speed
    @stopping = false
  end

  def run
    before_running

    while !@stopping
      process_board_buffer
      @board.next_tick
      sleep 1.0 / @speed
    end

    after_running
  end

  protected

  def before_running; end
  def after_running; end

  def process_board_buffer
    raise 'Implement me'
  end

  def get_runner_width
    raise 'Implement me'
  end

  def get_runner_height
    raise 'Implement me'
  end
end
