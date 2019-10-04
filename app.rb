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

  post '/para-sleep-check' do
    if @game.current_turn.status.asleep?
      @status = "asleep"
      erb :status
    elsif @game.current_turn.status.paralysed? && rand(3) == 2
      @status = "paralysed"
      erb :status
    else
      redirect "/#{params[:attack_type].downcase.split.join('-')}" if @game.current_turn.is_a? Player
      redirect "/#{@game.current_turn.move(@game.defending_player)}"
    end
  end

  get '/tackle' do
    @type = "Tackle"
    Attack.new.tackle(@game.defending_player)
    erb :attack
  end

  get '/lucky-strike' do
    @type = "Lucky Strike"
    Attack.new.lucky_strike(@game.defending_player)
    erb :attack
  end

  get '/poison-sting' do
    @type = "Poison Sting"
    redirect '/miss' if rand(1..10) == 10
    Attack.new.poison_sting(@game.defending_player)
    erb :attack
  end

  get '/thunder-wave' do
    @type = "Thunder Wave"
    redirect '/miss' if rand(1..10) >= 9
    Attack.new.thunder_wave(@game.defending_player)
    erb :attack
  end

  get '/hypnosis' do
    @type = "Hypnosis"
    redirect '/miss' if rand(1..10) >= 8
    Attack.new.hypnosis(@game.defending_player)
    erb :attack
  end

  get '/recover' do
    if @game.current_turn.hit_points > 100
      @hp_high = true
    else
      Attack.new.recover(@game.current_turn)
    end
    erb :recover
  end

  get '/miss' do
    erb :miss
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
      @game.switch_turns
      @game.current_turn.status.status_recover
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
