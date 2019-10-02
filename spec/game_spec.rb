require 'game'

describe Game do

  let(:player_2) { double :player }
  subject(:game) { described_class.new }

  describe "#attack" do
    it "damages a player" do
      expect(player_2).to receive(:receive_damage)
      game.attack(player_2)
    end
  end

end
