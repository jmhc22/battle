feature 'losing the game' do

  describe 'Player 2 loses all their hitpoints first' do
    context 'See a lose screen' do
      scenario 'at the end of the game' do
        sign_in_and_play
        19.times {
          click_button 'Attack'
          click_button 'OK'
        }
        expect(page).to have_content "Sid loses the game"
      end
    end
  end
end
