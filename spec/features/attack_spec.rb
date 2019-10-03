feature 'Tackle Player 2' do
  scenario 'Receives confirmation of attack' do
    sign_in_and_play
    click_button 'Tackle'
    expect(page).to have_content 'James attacks Sid'
  end

  scenario "player 2 HP reduces by 10HP" do
    sign_in_and_play
    click_button 'Tackle'
    click_button 'OK'
    expect(page).not_to have_content 'Sid: 100HP'
    expect(page).to have_content 'Sid: 85HP'
  end
end

feature 'Player 2 Attacks Back (second turn)' do
  scenario 'Receives confirmation of attack' do
    sign_in_and_play
    click_button 'Tackle'
    click_button 'OK'
    click_button 'Tackle'
    expect(page).to have_content 'Sid attacks James'
  end

  scenario "player 1 HP reduces by 10HP" do
    sign_in_and_play
    click_button 'Tackle'
    click_button 'OK'
    click_button 'Tackle'
    click_button 'OK'
    expect(page).not_to have_content 'James: 100HP'
    expect(page).to have_content 'James: 85HP'
  end
end