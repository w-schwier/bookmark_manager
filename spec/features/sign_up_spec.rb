feature 'User and password' do
  scenario 'sign up and create password' do
    sign_in
    expect(current_path).to eq '/links'
    expect(page).to have_content "Welcome sam@sam.sam"
    expect(User.count).to eq 1
  end
end
