require 'game'

describe Game do

  let(:status_obj) { double :status, status_recover: nil }
  let(:player_1) { double :player, status: status_obj }
  let(:player_2) { double :player, status: nil }
  subject(:game) { described_class.new(player_1: player_1, player_2: player_2) }

  describe "#player_1" do
    it "retrieves the first player" do
      expect(game.player_1).to eq player_1
    end
  end

  describe "#player_2" do
    it "retrieves the second player" do
      expect(game.player_2).to eq player_2
    end
  end

  describe '#current_turn' do
    it 'starts as player 1' do
      expect(game.current_turn).to eq player_1
    end
  end

  describe '#switch_turns' do
    it 'changes the current turn to the other player' do
      game.switch_turns
      expect(game.current_turn).to eq player_2
    end
  end
end
