require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'User', email: 'Email.com', password: 'Password')
  end

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without an email' do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = User.new(password: nil)
    expect(user).to_not be_valid
  end
end
