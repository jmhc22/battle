feature 'Tackle Player 2' do
  scenario 'Receives confirmation of tackle attack', js: true do
    sign_in_and_play
    find('#normal').click
    expect(page).to have_content 'James used Normal Attack'
  end

  scenario "player 2 HP reduces by 15HP", js: true do
    sign_in_and_play
    find('#normal').click
    expect(page).not_to have_content 'Sid: 150HP'
    expect(page).to have_content 'Sid: 135HP'
  end
end

feature 'Player 2 Attacks Back (second turn)', js: true do
  scenario 'Receives confirmation of attack', js: true do
    sign_in_and_play
    find('#normal').click
    find('#poischeck').click
    find('#normal').click
    expect(page).to have_content 'Sid used Normal Attack'
  end

  scenario "player 1 HP reduces by 15HP", js: true do
    sign_in_and_play
    find('#normal').click
    find('#poischeck').click
    find('#normal').click
    find('#poischeck').click
    expect(page).not_to have_content 'James: 150HP'
    expect(page).to have_content 'James: 135HP'
  end
end

feature 'Lucky Strike attack can be selected as an option', js: true do
  scenario 'Deals a random amount of damage (40HP in this example)' do
    allow_any_instance_of(Array).to receive(:sample).and_return(40)
    sign_in_and_play
    find('#lucky').click
    find('#poischeck').click
    expect(page).not_to have_content 'Sid: 150HP'
    expect(page).to have_content 'Sid: 110HP'
  end
end
