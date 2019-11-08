# frozen_string_literal: true

require 'rails_helper'
require 'pry'

<<<<<<< HEAD
RSpec.feature 'Timeline', type: :feature do
=======
RSpec.feature 'Timeline', type: :feature do # rubocop:todo Metrics/BlockLength
>>>>>>> jordan2
  scenario 'Can submit posts and view them' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'jordan123@gmail.com'
<<<<<<< HEAD
    fill_in 'Username', with: 'jojo123'
    fill_in 'Password', with: '123456', match: :first
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    click_link 'New Post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Create Post'
=======
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
>>>>>>> jordan2
    expect(page).to have_content('Hello, world!')
  end

  scenario 'posts includes time in which created' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'jordan123@gmail.com'
<<<<<<< HEAD
    fill_in 'Username', with: 'jojo123'
    fill_in 'Password', with: '123456', match: :first
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    click_link 'New Post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Create Post'
    expect(page).to have_content(time_ago_in_words(Time.now))
=======
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content(Time.now.utc)
>>>>>>> jordan2
  end

  scenario 'New line in post' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'jordan123@gmail.com'
<<<<<<< HEAD
    fill_in 'Username', with: 'jojo123'
    fill_in 'Password', with: '123456', match: :first
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    click_link 'New Post'
    fill_in 'Message', with: "Bye, \n world!"
    click_button 'Create Post'
=======
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    click_link 'New post'
    fill_in 'Message', with: "Bye, \n world!"
    click_button 'Submit'
>>>>>>> jordan2
    expect('Bye').to appear_before('br').appear_before('world!')
  end
end
