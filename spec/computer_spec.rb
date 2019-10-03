require 'computer'

describe Computer do

  let(:player) { double :player, hit_points: 100 }
  let(:attack) {double :attack, tackle: "tackle", lucky_strike: "lucky_strike" }
  let(:attack_class) { double :attack_class, new: attack }
  let(:computer) { described_class.new(attack_class: attack_class) }

  describe '#move' do
    it 'expect computer to use either tackle or lucky_strike' do
      allow(computer).to receive(:rand).and_return 2
      expect(attack).to receive(:tackle).with(player)
      computer.move(player)
    end
  end
end
