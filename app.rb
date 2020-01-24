require 'sinatra/base'
require './lib/player'
require './lib/attack'
require './lib/game'
require './lib/computer'
require './lib/status'
require 'json'


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
    player_1 = Player.new(params[:player_1_name], 'p1')
    player_2 = Computer.new
    @game = Game.create(player_1, player_2)
    redirect '/play'
  end

  get '/multi' do
    erb :multi
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name], 'p1')
    player_2 = Player.new(params[:player_2_name], 'p2')
    @game = Game.create(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    redirect '/' if @game.started?
    @game.start_game
    erb :play
  end

  post '/api/battle' do
    move = JSON.parse(request.body.read)['attack']
    outcome, move_made = @game.play_turn(move)
    { "outcome": outcome, "move": move_made }.to_json
  end

  get '/api/gameover' do
    gameover = @game.over?
    { "gameover": gameover }.to_json
  end

  get '/api/poison' do
    outcome = @game.poison_check
    { "outcome": outcome }.to_json
  end

  get '/api/switch' do
    player_is_computer = @game.switch_turns
    { "computer": player_is_computer, 'cur_name': @game.current_turn.name, 'current': @game.current_turn.code, 'defending': @game.defending_player.code }.to_json
  end

  get '/api/compturn' do
    move = @game.current_turn.move(@game.defending_player)
    { "move": move }.to_json
  end

  get '/api/conditions' do
    df = @game.defending_player
    { 'hitpoints': df.hit_points, 'poi': df.status.poisoned?, 'par': df.status.paralysed?, 'sle': df.status.asleep?  }.to_json
  end

  get '/lose' do
    erb :lose
  end

  run! if app_file == $0
end
