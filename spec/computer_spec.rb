require 'computer'

describe Computer do

  let(:player) { double :player, hit_points: 100 }
  let(:computer) { described_class.new }

  describe '#move' do
    it 'expect computer to use either tackle or lucky_strike' do
      allow(computer).to receive(:early_game).and_return "lucky strike"
      expect(computer.move(player)).to eq "lucky strike"
    end
  end
end
