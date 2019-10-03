require 'attack'

describe Attack do

  let(:player_1) { double :player }
  subject(:attack) { described_class.new }

  describe "#tackle" do
    it "damages a player" do
      expect(player_1).to receive(:receive_damage)
      attack.tackle(player_1)
    end
  end
end
