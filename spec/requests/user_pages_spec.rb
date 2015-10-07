require 'spec_helper'

describe "UserPages" do
  subject {page}
  let(:base) {"Sergey's Blog"}
  
  describe "Signup page" do
    before {visit signup_path}

    it {should have_content('Sign Up')}
    it {should have_title("#{base} | Sign Up")}
  end

end

