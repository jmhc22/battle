require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/attack'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/attack' do
    @game = $game
    Attack.new.run(@game.defending_player)
    erb :attack
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1: player_1, player_2: player_2)
    redirect '/play'
  end

  post '/switch-turns' do
    $game.switch_turns
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
