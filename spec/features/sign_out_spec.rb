feature 'user signs out' do
  before do
    sign_up
  end

  scenario 'while signed in' do
    sign_in
    click_button 'Sign out'
    expect(page).to have_content("Goodbye")
    expect(page).not_to have_content('Welcome, sam@sam.sam')
  end
end
