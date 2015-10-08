require 'spec_helper'

describe "UserPages" do
  subject {page}
  let(:base) {"Sergey's Blog"}
  
  describe "Signup page" do
    before {visit signup_path}
    let(:submit) { "Create my account"}

    it {should have_content('Sign Up')}
    it {should have_title("#{base} | Sign Up")}

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
  end

  describe "User proofile page" do
    let(:user) {FactoryGirl.create(:user)}
    before {visit user_path(user)}

    it {should have_content(user.name)}
    it {should have_title(user.name)}
  end

end

