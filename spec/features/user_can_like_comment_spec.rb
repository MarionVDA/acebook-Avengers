# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Like comment', type: :feature do
  scenario 'User can like a comment' do
    user1 = User.create(email: 'test123@gmail.com', username: 'test1', password: '123456')
    post1 = Post.create(message: 'Hello', user_id: user1.id)
    user2 = User.create(email: 'test1234@gmail.com', username: 'test2', password: '123456')
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'test1234@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    first('.like_btn').click_button
    expect(page).to have_content('1 Like')
  end

  scenario 'Increase like count' do
    user1 = User.create(email: 'test123@gmail.com', username: 'test1', password: '123456')
    post1 = Post.create(message: 'Hello', user_id: user1.id)
    user2 = User.create(email: 'test1234@gmail.com', username: 'test2', password: '123456')
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'test1234@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    first('.like_btn').click_button
    click_link('Logout')
    fill_in 'Email', with: 'test123@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    first('.like_btn').click_button
    expect(page).to have_content('2 Likes')
  end

  scenario 'User can unlike a comment' do
    user1 = User.create(email: 'test123@gmail.com', username: 'test1', password: '123456')
    post1 = Post.create(message: 'Hello', user_id: user1.id)
    user2 = User.create(email: 'test1234@gmail.com', username: 'test2', password: '123456')
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'test1234@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    first('.like_btn').click_button
    first('.unlike_btn').click_button
    expect(page).to have_content('0 Like')
  end
end
