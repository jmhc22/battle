def sign_in_and_play
  visit('/')
  click_button 'Multi Player'
  fill_in :player_1_name, with: 'James'
  fill_in :player_2_name, with: 'Sid'
  click_button 'Submit'
end

def sign_in_and_play_single
  visit('/')
  click_button 'Single Player'
  fill_in :player_1_name, with: 'James'
  click_button 'Submit'
end
