require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/attack'
require './lib/computer'
require './lib/status'

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

  post '/name' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Computer.new
    @game = Game.create(player_1, player_2)
    redirect '/play'
  end

  get '/multi' do
    erb :multi
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    @game = Game.create(player_1, player_2)
    redirect '/play'
  end

  post '/comp-attack' do
    if @game.current_turn.move(@game.defending_player) == "tackle"
      redirect '/attack'
    else
      redirect '/rand-attack'
    end
  end

  get '/attack' do
    Attack.new.tackle(@game.defending_player)
    @type = "Tackle"
    erb :attack
  end

  get '/rand-attack' do
    Attack.new.lucky_strike(@game.defending_player)
    @type = "Lucky Strike"
    erb :attack
  end

  get '/poison-sting' do
    Attack.new.poison_sting(@game.defending_player)
    @type = "Poison Sting"
    erb :attack
  end

  post '/poison-check' do
    redirect '/switch-turns' unless @game.defending_player.status.poisoned?
    @game.defending_player.poison_damage
    erb :poison
  end

  get '/switch-turns' do
    if @game.defending_player.hit_points <= 0
      redirect '/lose'
    else
      @game.current_turn.status.status_recover
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
