require 'attack'

describe Attack do

  let(:player_1) { double :player1, name: 'attacker' }
  let(:player_2) { double :player2, name: 'defender' }
  subject(:attack) { described_class.new }

  describe "#tackle" do
    it "damages a player" do
      expect(player_2).to receive(:receive_damage)
      attack.use_move('normal', player_1, player_2)
    end
  end
end
