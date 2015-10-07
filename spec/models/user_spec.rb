require 'spec_helper'

describe User do
  before {@user = User.new(name: "user_name", email: "user@email.ru", password: "password", password_confirmation: "password")}
  subject {@user}
  
  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it {should respond_to(:password_digest)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}
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

  describe "when email format is incorrect" do
    it "should be incorrect" do
      %W[mail@mail,ru mail.ru mail@mail mail@mail*mail.ru].each do |adress|
        @user.email = adress
        expect(@user.email).not_to be_valid
      end
    end
  end

  describe "when email format is correct" do
    it "should be correct" do
      %W[mail@mail.ru ma.il@mail.ru ma-il@mail.ru].each do |adress|
        @user.email = adress
        expect(@user.email).to be_valid
      end
    end
  end


end
