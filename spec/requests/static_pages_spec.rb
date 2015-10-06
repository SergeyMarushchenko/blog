require 'spec_helper'

describe "StaticPages" do

  let(:base) {"Blog"}
  
  describe "home page" do

    it "should have the content 'Blog'" do
      visit '/static_pages/home'
      expect(page).to have_content('Home')
    end

    it "should have the right title" do
    visit '/static_pages/home'
    expect(page).to have_title("#{base} | Home")
    end
  end

  describe "help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the right title" do
    visit '/static_pages/help'
    expect(page).to have_title("#{base} | Help")
    end
  end

  describe "about page" do

    it "should have the content 'About us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end

    it "should have the right title" do
    visit '/static_pages/about'
    expect(page).to have_title("#{base} | About Us")
    end

  end

  describe "contact page" do

    it "should have the content 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contacts')
    end

    it "should have the right title" do
    visit '/static_pages/contact'
    expect(page).to have_title("#{base} | Contacts")
    end

  end

end
