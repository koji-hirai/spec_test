require 'spec_helper'

describe User do

#　名前とEmailが登録出来る
  it "is valid with a name and email" do
    user = User.new(
      name: 'hoge', email: 'test@test.com')
    expect(user).to be_valid
  end

#　名前がないと登録できない
  it "is invalid without a name" do
    expect(User.new(name: nil)).to have(1).errors_on(:name)
  end

#　Emailがないと登録できない
  it "is invalid without a email" do
    expect(User.new(email: nil)).to have(1).errors_on(:email)
  end

#　同じEmailだと登録できない
  it "is invalid with a duplicate email address" do
    User.create(
      name: 'hoge', email: 'test@test.com')
    user = User.new(
      name: 'huga', email: 'test@test.com')
    expect(user).to have(1).errors_on(:email)
  end
  
  it "is valid with a difference email address" do
    User.create(
      name: 'hoge', email: 'testa@test.com')
    user = User.new(
      name: 'huga', email: 'testb@test.com')
    expect(user).to be_valid
  end
end

describe User do
  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end
  
  it "is valid with a name and email" do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end
  
  it "is invalid without a name" do
    user = FactoryGirl.build(:user, name: nil)
    expect(user).to have(1).errors_on(:name)
  end
  
  it "is invalid without a email" do
    user = FactoryGirl.build(:user, email: nil)
    expect(user).to have(1).errors_on(:email)
  end
  
  it "is invalid without a email" do
    user = FactoryGirl.build(:user, email: "　")
    expect(user).to have(1).errors_on(:email)
  end
end

describe User do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end
  
  it "is valid with a name and email" do
    expect(build(:user)).to be_valid
  end
  
  it "is invalid without a name" do
    expect(build(:user, name: nil)).to have(1).errors_on(:name)
  end
  
  it "is invalid without a email" do
    expect(build(:user, email: nil)).to have(1).errors_on(:email)
  end
  
  it "is invalid without a email" do
    expect(build(:user, email: nil)).to have(1).errors_on(:email)
  end
end

describe "filter name by match_name" do
  before :each do
    @john = User.create(name: 'John', email: 'john@example.com')
    @tim = User.create(name: 'Tim', email: 'tim@example.com')
    @jonson = User.create(name: 'Jonson', email: 'jonson@example.com')
  end

  context "matching name" do
    it "returns a sorted array of results that match" do
      expect(User.match_name("J")).to eq [@john, @jonson]
    end
  end

  context "non-matching name" do
    it "returns a sorted array of results that match" do
      expect(User.match_name("J")).to_not include @tim
    end
  end
end
