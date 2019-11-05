
require 'rails_helper'
require 'pry'

RSpec.feature 'Comments', type: :feature do
  scenario 'Can comment on posts' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'jordan123@gmail.com'
    fill_in 'Username', with: 'jojo123'
    fill_in 'Password', with: '123456', match: :first
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    click_link 'New Post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Create Post'
    click_link 'Comments'
    fill_in 'comment_message', with: 'Bye, World'
    click_button 'Create Comment'
    expect(page).to have_content('Bye, World')
  end

  scenario 'Can delete comment' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'jordan123@gmail.com'
    fill_in 'Username', with: 'jojo123'
    fill_in 'Password', with: '123456', match: :first
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    click_link 'New Post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Create Post'
    click_link 'Comments'
    fill_in 'comment_message', with: 'Bye, World'
    click_button 'Create Comment'
    click_link 'Delete'
    expect(page).not_to have_content('Bye, World')
  end

  scenario 'Can edit comment' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'jordan123@gmail.com'
    fill_in 'Username', with: 'jojo123'
    fill_in 'Password', with: '123456', match: :first
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    click_link 'New Post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Create Post'
    click_link 'Comments'
    fill_in 'comment_message', with: 'Bye, World'
    click_button 'Create Comment'
    first("#modify").click_link 'Edit'
    fill_in 'comment_message', with: 'Hell No!'
    click_button 'Update Comment'
    expect(page).to have_content('Hell No')
  end

  scenario 'Can not edit comment after 10mins' do
    @fake_time =  Time.now + (11*60)
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'jordan123@gmail.com'
    fill_in 'Username', with: 'jojo123'
    fill_in 'Password', with: '123456', match: :first
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    click_link 'New Post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Create Post'
    click_link 'Comments'
    fill_in 'comment_message', with: 'Bye, World'
    click_button 'Create Comment'
    allow(Time).to receive(:now).and_return(@fake_time)
    first("#modify").click_link 'Edit'
    expect(page).to have_content('Comment can only be updated within 10 minutes')
  end

  scenario 'User can not delete someone elses comment' do
    user1 = User.create(email: 'test123@gmail.com', username: 'test1', password: '123456')
    post1 = Post.create(message: 'Hello', user_id: user1.id)
    user2 = User.create(email: 'test1234@gmail.com', username: 'test2', password: '123456')
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'test123@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Comments'
    fill_in 'comment_message', with: 'Bye, World'
    click_button 'Create Comment'
    click_link 'Logout'
    fill_in 'Email', with: 'test1234@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Comments'
    first("#modify").click_link 'Delete'
    expect(page).to have_content('You are not the owner of this comment')
  end

  scenario 'User can not edit someone elses comment' do
    user1 = User.create(email: 'test123@gmail.com', username: 'test1', password: '123456')
    post1 = Post.create(message: 'Hello', user_id: user1.id)
    user2 = User.create(email: 'test1234@gmail.com', username: 'test2', password: '123456')
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'test123@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Comments'
    fill_in 'comment_message', with: 'Bye, World'
    click_button 'Create Comment'
    click_link 'Logout'
    fill_in 'Email', with: 'test1234@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'Comments'
    first("#modify").click_link 'Edit'
    expect(page).to have_content('You are not the owner of this comment')
  end

end
