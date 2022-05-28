# frozen_string_literal: true

RSpec.describe GameOfLife::Board do
  it 'can be initialized' do
    board = GameOfLife::Board.new(width: 2, height: 2)
    expect(board.as_buffer).to eq([false, false, false, false])
  end

  it 'can be set as a random' do
    board = GameOfLife::Board.new(width: 2, height: 1)
    board.set_random

    expect(board.as_buffer).to eq([false, false])
      .or eq([true, false])
      .or eq([false, true])
      .or eq([true, true])
  end

  it 'achives the blinker' do
    board = GameOfLife::Board.new(width: 5, height: 5)

    board.set_from_buffer([
      false, false, false, false, false,
      false, false, true, false, false,
      false, false, true, false, false,
      false, false, true, false, false,
      false, false, false, false, false,
    ])
    board.next_tick
    expect(board.as_buffer).to eq([
      false, false, false, false, false,
      false, false, false, false, false,
      false, true, true, true, false,
      false, false, false, false, false,
      false, false, false, false, false,
    ])
    board.next_tick
    expect(board.as_buffer).to eq([
      false, false, false, false, false,
      false, false, true, false, false,
      false, false, true, false, false,
      false, false, true, false, false,
      false, false, false, false, false,
    ])
  end

  it 'achives the toad' do
    board = GameOfLife::Board.new(width: 6, height: 6)

    board.set_from_buffer([
      false, false, false, false, false, false,
      false, false, false, false, false, false,
      false, false, true, true, true, false,
      false, true, true, true, false, false,
      false, false, false, false, false, false,
      false, false, false, false, false, false
    ])
    board.next_tick
    expect(board.as_buffer).to eq([
      false, false, false, false, false, false,
      false, false, false, true, false, false,
      false, true, false, false, true, false,
      false, true, false, false, true, false,
      false, false, true, false, false, false,
      false, false, false, false, false, false
    ])
    board.next_tick
    expect(board.as_buffer).to eq([
      false, false, false, false, false, false,
      false, false, false, false, false, false,
      false, false, true, true, true, false,
      false, true, true, true, false, false,
      false, false, false, false, false, false,
      false, false, false, false, false, false
    ])
  end
end
