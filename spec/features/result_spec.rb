feature 'Result' do
  scenario "page displays the user's most used language" do
    visit '/'
    fill_in :username, with: 'usmanj'
    click_button 'Submit'
    expect(page).to have_content "This user's most used language on GitHub is"
  end

  scenario "page states the user has no repos if the user has no repos" do
    visit '/'
    fill_in :username, with: 'usman'
    click_button 'Submit'
    expect(page).to have_content "This user does not have any repos. Please try again."
  end

  scenario "page returns to home page if home button is clicked" do
    visit '/'
    fill_in :username, with: 'usmanj'
    click_button 'Submit'
    click_button 'Home'
    expect(current_path).to eq '/'
  end
end
