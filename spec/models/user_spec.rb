require 'spec_helper'

describe "User" do
  before {@user = User.new(name: "user_name", email: "user@email.ru", password: "password", password_confirmation: "password")}
  subject {@user}
  
  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it {should respond_to(:password_digest)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}
  it {should respond_to(:remember_token)}
  it {should respond_to(:authenticate)}
  it {should be_valid}

  describe "if name is not entered" do
    before {@user.name = " "}
    it {should_not be_valid}
  end
  describe "if email is not entered" do
    before {@user.email = " "}
    it {should_not be_valid}
  end

  describe "name is too long" do
    before {@user.name = "a"*51}
    it {should_not be_valid}
  end

  describe "name is too short" do
    before {@user.name = "a"*1}
    it {should_not be_valid}
  end

  describe "remember token" do
    before {@user.save}
    its(:remember_token) {should_not be_blank}
  end
end
