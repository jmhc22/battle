feature 'turns tracking' do

  describe 'Switch turns with two players' do
    context 'seeing the current turn' do
      scenario 'at the start of the game' do
        sign_in_and_play
        expect(page).to have_content "James's turn"
      end

      scenario 'after player 1 attacks', js: true do
        sign_in_and_play
        find('#normal').click
        find('#poischeck').click
        expect(page).not_to have_content "James's turn"
        expect(page).to have_content "Sid's turn"
      end
    end


  describe 'Switch turns with one player and computer' do
      scenario 'after player 1 attacks', js: true do
        sign_in_and_play_single
        find('#normal').click
        find('#poischeck').click
        expect(page).not_to have_content "James's turn"
        expect(page).to have_content "Computer's turn"
      end
    end
  end
end
