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

  get '/play' do
    erb :play
  end

  get '/api/battle' do
    p 'api called'
    {'hello': 'you'}.to_json
  end

  post '/api/battle' do
    move = JSON.parse(request.body.read)['attack']
    outcome = @game.play_turn(move)
    { "outcome": outcome }.to_json
  end

  get '/lose' do
    erb :lose
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
