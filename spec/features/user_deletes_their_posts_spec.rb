require 'rails_helper'


RSpec.feature "delete posts", type: :feature do
  scenario "User can delete their own posts" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "jordan123@gmail.com"
    fill_in "Username", with: "jojo123"
    fill_in "Password", with: "123456", :match => :first
    fill_in "Password confirmation", with: "123456"
    click_button "Sign up"
    click_link "New Post"
    fill_in "Message", with: "Hello, world!"
    click_button "Create Post"
    click_link "Delete"
    expect(page).to have_content("Post was successfully destroyed.")
  end


  scenario "User can not delete someone elses posts" do

    user1 = User.create({email: "test123@gmail.com", password: "123456"})
    post1 = Post.create({message: "Hello", user_id: user1.id})
    user2 = User.create({email: "test1234@gmail.com", password: "123456"})
    visit "/"
    click_link "Login"
    fill_in "Email", with: "test1234@gmail.com"
    fill_in "Password", with: "123456"
    click_button "Log in"
    click_link "Delete"
    expect(page).to have_content("You are not the owner of this post")
  end
end
