feature 'Enter names in Multi Player mode' do
  scenario 'submitting names' do
    sign_in_and_play
    expect(page).to have_content 'JAMES vs. SID'
  end
end

feature 'Enter names in Single Player mode' do
  scenario 'submitting names' do
    sign_in_and_play_single
    expect(page).to have_content 'JAMES vs. COMPUTER'
  end
end
