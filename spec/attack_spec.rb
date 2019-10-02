require 'attack'

describe Attack do

  let(:player_1) { double :player }
  subject(:attack) { described_class.new }

  describe "#run" do
    it "damages a player" do
      expect(player_1).to receive(:receive_damage)
      attack.run(player_1)
    end
  end
end
