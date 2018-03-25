require 'rails_helper'


describe "the signin process", :type => :feature do
  before :each do
    User.create(name: 'example', email: 'user@example.com', password: 'password', password_confirmation: 'password')
  end

  it "signs me in" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Logged in!'
  end
end
