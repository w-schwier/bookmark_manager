feature 'User and password' do
  scenario 'sign up and create password' do
    sign_in
    expect(current_path).to eq '/links'
    expect(page).to have_content "Welcome sam@sam.sam"
    expect(User.count).to eq 1
  end

  scenario 'sign in with two different passwords' do
    visit '/'
    fill_in 'email', with: "sam@sam.sam"
    fill_in 'password', with: "sam1"
    fill_in 'confirm_password', with: "sam2"
    click_button "Sign in"
    expect(User.count).to eq 0
  end

  scenario 'user cannot sign up without password validation' do
    visit '/'
    fill_in 'email', with: "sam@sam.sam"
    fill_in 'password', with: "sam1"
    fill_in 'confirm_password', with: "sam2"
    click_button "Sign in"
    expect(current_path).to eq '/create_user'
    expect(page).to have_content("Passwords dont match, try again")
  end

  scenario 'user cannot sign up without valid email address' do
    visit '/'
    fill_in 'email', with: "samsam.sam"
    fill_in 'password', with: "sam1"
    fill_in 'confirm_password', with: "sam1"
    click_button "Sign in"
    expect(current_path).to eq '/create_user'
    # expect(page).to have_content("Email not valid")
  end

  scenario 'user cannot sign up with blank email address' do
    visit '/'
    fill_in 'email', with: ""
    fill_in 'password', with: "sam1"
    fill_in 'confirm_password', with: "sam1"
    click_button "Sign in"
    expect(current_path).to eq '/create_user'
    # expect(page).to have_content("Email not valid")
  end
end
