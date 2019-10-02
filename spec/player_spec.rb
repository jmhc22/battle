require 'player'

describe Player do

    subject(:player_1) { Player.new('player_1') }
    subject(:player_2) { Player.new('player_2') }

  describe "#name}" do
    it "returns name" do
      expect(player_1.name).to eq 'player_1'
    end
  end

  describe "#hit_points" do
    it "returns hit points" do
      expect(player_1.hit_points).to eq described_class::DEFAULT_HIT_POINTS
    end
  end

  describe "#receive_damage" do
    it "reduces the players hit points" do
      expect {player_1.receive_damage }.to change {player_1.hit_points }.by(-10)
    end
  end
end
