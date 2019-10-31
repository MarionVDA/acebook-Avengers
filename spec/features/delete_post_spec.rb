require 'rails_helper'

RSpec.feature "delete posts", type: :feature do
  scenario "user can delete a post" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "jordan123@gmail.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Sign up"
    click_link "New post"
    fill_in "Message", with: "Bye, world!"
    click_button "Submit"
    click_link "delete"
    expect(page).not_to have_content("Bye, world!")
  end
end
