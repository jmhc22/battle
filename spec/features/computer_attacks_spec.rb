feature 'Computer attacks using tackle' do
  scenario 'after player 1 attacks' do
    sign_in_and_play_single
    click_button 'Tackle'
    click_button 'OK'
    click_button 'OK'
    expect(page).to have_content "Computer attacks James"
    click_button 'OK'
    expect(page).to_not have_content "James: 100HP"
  end
end
