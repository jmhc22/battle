feature 'Computer attacks using tackle' do
  scenario 'after player 1 attacks', js: true do
    sign_in_and_play_single
    allow_any_instance_of(Array).to receive(:sample).and_return("normal")
    find('#normal').click
    find('#poischeck').click
    find('#compturn').click
    expect(page).to have_content "Computer used Normal Attack"
    find('#poischeck').click
    expect(page).to_not have_content "James: 150HP"
    expect(page).to have_content "James: 135HP"
  end
end
