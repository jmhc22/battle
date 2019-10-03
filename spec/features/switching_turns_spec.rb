feature 'turns tracking' do

  describe 'Switch turns with two players' do
    context 'seeing the current turn' do
      scenario 'at the start of the game' do
        sign_in_and_play
        expect(page).to have_content "James's turn"
      end

      scenario 'after player 1 attacks' do
        sign_in_and_play
        click_button 'Tackle'
        click_button 'OK'
        expect(page).not_to have_content "James's turn"
        expect(page).to have_content "Sid's turn"
      end
    end


  describe 'Switch turns with one player and computer' do
      scenario 'after player 1 attacks' do
        sign_in_and_play_single
        click_button 'Tackle'
        click_button 'OK'
        expect(page).not_to have_content "James's turn"
        expect(page).to have_content "Computer's turn"
      end
    end
  end
end
