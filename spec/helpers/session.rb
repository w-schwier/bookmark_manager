module SessionHelpers

  def sign_up
    visit '/users/new'
    fill_in 'email', with: "sam@sam.sam"
    fill_in 'password', with: "sam1"
    fill_in 'confirm_password', with: "sam1"
    click_button "Sign up"
  end

  def sign_in
    visit '/sessions/new'
    fill_in :email, with: 'sam@sam.sam'
    fill_in :password, with: 'sam1'
    click_on "Sign in"
  end
end
