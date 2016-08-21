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

end
