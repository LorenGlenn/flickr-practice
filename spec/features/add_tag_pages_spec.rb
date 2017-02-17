require 'rails_helper'

describe "the add a tag process" do
  it "adds a new tag" do
    visit '/'
    click_on 'Sign Up'
    fill_in 'User name', :with => 'loren'
    fill_in 'Email', :with => 'loren@loren.com'
    fill_in 'Password', :with => '123123'
    fill_in 'Password confirmation', :with => '123123'
    click_on 'Sign up'
    click_on 'New Post'
    fill_in 'Title', :with => 'hi'
    click_on 'Create Post'
    click_on 'hi'
    click_link 'Tag this photo!'
    fill_in 'Name', :with => 'tagtest'
    click_on 'Create Tag'
    expect(page).to have_content 'hi'
  end
end
