module AuthHelpers
  def sign_in_as(user)
    visit '/'
    click_link "Sign in"
    fill_in "Name", with: user.name
    fill_in "Password", with: user.password
    click_button "Sign in"
    expect(page).to have_content "You have signed in"
  end
  
  def define_permission(user, action, thing)
    Permission.create! user: user, action: action, thing: thing
  end
end

RSpec.configure do |c|
  c.include AuthHelpers, type: :feature
end