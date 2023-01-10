require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before(:each) do
    @user = User.create!(name: 'name', email: 'email3.com', password: 'password')
    @bike = Bike.create(name: 'bikeone', bike_type: 'one', description: 'dasdas', brand: 'dasd', daily_rate: 231.23,
                        color: ['dasd'], images: { blue: 'dasda' })
  end

  it 'is valid with valid attributes' do
    expect(Reservation.new(bike_id: @bike.id, user_id: @user.id, reservation_date: '2021-03-01',
                           due_date: '2021-03-03')).to be_valid
  end

  it 'is not valid without a bike_id' do
    reservation = Reservation.new(bike_id: nil)
    expect(reservation).to_not be_valid
  end

  it 'is not valid without a user_id' do
    reservation = Reservation.new(user_id: nil)
    expect(reservation).to_not be_valid
  end
end
