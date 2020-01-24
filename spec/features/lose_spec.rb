feature 'losing the game' do

  describe 'Player 2 loses all their hitpoints first', js: true do
    context 'See a lose screen' do
      scenario 'at the end of the game' do
        sign_in_and_play
        18.times {
          find('#normal').click
          find('#poischeck').click
        }
        find('#normal').click
        expect(page).to have_content "loses the game"
      end
    end
  end
end
