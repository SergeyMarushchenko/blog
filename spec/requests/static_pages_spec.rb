require 'spec_helper'

describe "StaticPages" do
  
  describe "home page" do

    it "should have the content 'Blog'" do
      visit '/static_pages/home'
      expect(page).to have_content('Home')
    end

    it "should have the right title" do
    visit '/static_pages/home'
    expect(page).to have_title("Blog | Home")
    end
  end

  describe "help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the right title" do
    visit '/static_pages/help'
    expect(page).to have_title("Blog | Help")
    end
  end

  describe "about page" do

    it "should have the content 'About us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end

    it "should have the right title" do
    visit '/static_pages/about'
    expect(page).to have_title("Blog | About Us")
    end

  end

end
