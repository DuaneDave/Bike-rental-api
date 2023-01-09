require 'rails_helper'

RSpec.describe Reservation, type: :model do
  User.create(name: 'User', email: 'Email', password: 'Password')
  Bike.create(name: 'Bike', bike_type: 'Mountain', description: 'This is a bike', brand: 'Trek', daily_rate: 10,
              images: { blue: 'sdas' }, color: ['sdas'])

  it 'is valid with valid attributes' do
    expect(Reservation.new(bike_id: 1, user_id: 1, reservation_date: '2021-03-01',
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
