# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.feature 'Edit', type: :feature do
  scenario 'Can edit posts' do
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
    click_link 'Edit'
    fill_in 'Message', with: 'Edit, world!'
    click_button 'Update Post'
    expect(page).to have_content('Edit, world!')
  end
end
