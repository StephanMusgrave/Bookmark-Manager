require 'spec_helper'

feature "User signs up" do
  
  scenario "when being logged out" do
    lambda { sign_up}.should change(User, :count).by(1)
    expect(page).to have_content("welcome, alice@example.com")
    expect(user.first.email).to eq("alice@example.com")
  end

end