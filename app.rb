require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/attack'
require './lib/computer'

class Battle < Sinatra::Base
  enable :sessions

  before do
    @game = Game.instance
  end

  get '/' do
    erb :index
  end



  get '/single' do
    erb :single
  end




  get '/multi' do
    erb :multi
  end

  get '/attack' do
    Attack.new.tackle(@game.defending_player)
    erb :attack
  end

  get '/rand-attack' do
    Attack.new.lucky_strike(@game.defending_player)
    erb :attack
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    @game = Game.create(player_1, player_2)
    redirect '/play'
  end

  post '/switch-turns' do
    if @game.defending_player.hit_points <= 0
      redirect '/lose'
    else
      @game.switch_turns
      redirect '/play'
    end
  end

  get '/lose' do
    erb :lose
  end

  get '/play' do
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
