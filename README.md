# Game Of Life

Game of life simple implementation

## Try it out

Install dependencies

    $ bundle install

Run tests

    $ bundle exec rspec

## Example

Run the example to visualize the game of life in your terminal

    $ ruby example/example.rb

## Runner

Modeled in a `runner` based way so you can extend to other kind of runners:

```Ruby
require 'game-oflife'

class OpenGLRunner < GameOfLife::BaseRunner
  protected

  def before_running
    # Preprare OpenGL
  end

  def process_board_buffer
    buffer = @board.as_buffer

    # open_gl_engne.render_boolean_buffer(buffer) ???
  end

  def get_runner_width
    # open_gl_engne.window_width ???
  end

  def get_runner_height
    # open_gl_engne.window_height ???
  end
end

runner = OpenGLRunner.new(speed: 10)
runner.board.set_random

runner.run
```

### Or just get the board state

```Ruby
require 'game-oflife'

board = GameOfLife::Board.new(width: 100, height: 100)
board.set_random

board.next_tick

current_state = board.as_buffer

# Print or do what ever with the current state
# > [true, false, true, false, false...] 
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/omarandstuff/game_of_life. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to be kind.

## License

The project is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
