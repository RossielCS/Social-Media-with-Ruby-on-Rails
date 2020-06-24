require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.feature 'Notifications', type: :feature do
  before :each do
    @user_one = User.create(name: 'Emma', email: 'emma@mail.com', password: '123456')
    @user_two = User.create(name: 'Alex', email: 'alex@mail.com', password: '123456')
    @friendship = Friendship.create(user_id: @user_two.id, friend_id: @user_one.id, status: nil)
  end

  it 'shows the quantity of notifications' do
    visit user_session_path
    fill_in 'user[email]', with: @user_one.email
    fill_in 'user[password]', with: @user_one.password
    click_button 'Log in'
    expect(page).to have_css('.notification', text: '1')
    find('.notification', match: :first).click
    expect(page).to have_content('Notifications')
    expect(page).to have_content('You have a friendship request from:')
    expect(page).to have_content('Name: Alex')
    expect(page).to have_selector(:link_or_button, 'Accept Friendship')
    expect(page).to have_selector(:link_or_button, 'Reject Friendship')
  end

  it 'notifies if the user has sent a friendship request' do
    visit user_session_path
    fill_in 'user[email]', with: @user_two.email
    fill_in 'user[password]', with: @user_two.password
    click_button 'Log in'
    expect(page).to have_css('.notification', text: '1')
    find('.notification', match: :first).click
    expect(page).to have_content('Notifications')
    expect(page).to have_content('You have a sent friendship request to:')
    expect(page).to have_content('Name: Emma')
    expect(page).to have_content('Pending Response')
  end

  it 'removes the notification if the user accepts the friendship request' do
    visit user_session_path
    fill_in 'user[email]', with: @user_one.email
    fill_in 'user[password]', with: @user_one.password
    click_button 'Log in'
    expect(page).to have_css('.notification', text: '1')
    find('.notification', match: :first).click
    expect(page).to have_content('Notifications')
    expect(page).to have_content('You have a friendship request from:')
    expect(page).to have_content('Name: Alex')
    click_button 'Accept Friendship'
    expect(page).to have_content('Friendship has been accepted')
    expect(page).to have_css('.notification', text: '')
    expect(page).to have_content('You don\'t have notifications at the moment.')
  end

  it 'removes the notification if the user rejects the friendship request' do
    visit user_session_path
    fill_in 'user[email]', with: @user_one.email
    fill_in 'user[password]', with: @user_one.password
    click_button 'Log in'
    expect(page).to have_css('.notification', text: '1')
    find('.notification', match: :first).click
    expect(page).to have_content('Notifications')
    expect(page).to have_content('You have a friendship request from:')
    expect(page).to have_content('Name: Alex')
    click_button 'Reject Friendship'
    expect(page).to have_content('Friendship has been rejected')
    expect(page).to have_css('.notification', text: '')
    expect(page).to have_content('You don\'t have notifications at the moment.')
  end
end
# rubocop:enable Metrics/BlockLength
