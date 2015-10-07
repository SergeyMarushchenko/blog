require 'spec_helper'

describe "StaticPages" do
  subject {page}
  let(:base) {"Sergey's Blog"}
  
  describe "home page" do
    before {visit root_path}

    it {should have_content('Blog')}
    it {should have_title("#{base}")}
  end

  describe "help page" do
    before {visit help_path}

    it {should have_content('Help')}
    it {should have_title("#{base} | Help")}
  end

  describe "About Us page" do
    before {visit about_path}

    it {should have_content('About Us')}
    it {should have_title("#{base} | About Us")}
  end

  describe "Contact page" do
    before {visit contact_path}

    it {should have_content('Contact')}
    it {should have_title("#{base} | Contact")}
  end

end
