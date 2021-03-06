feature 'Viewing Hitpoints' do
  scenario 'player 2 starts with 100HP' do
    sign_in_and_play
    expect(page).to have_content 'Sid: 150HP'
  end

  scenario 'player 1 starts with 100HP' do
    sign_in_and_play
    expect(page).to have_content 'James: 150HP'
  end
end
