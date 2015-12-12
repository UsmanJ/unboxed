feature 'Username' do
  scenario "page has the content 'Unboxed'" do
    visit '/'
    expect(page).to have_content 'Unboxed'
  end

  scenario "field should lead to user page when submitted" do
    visit '/'
    fill_in :username, with: 'UsmanJ'
    click_button 'Submit'
    expect(page).to have_content 'Usman Jamil'
  end
end
