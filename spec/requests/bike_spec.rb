require 'rails_helper'

RSpec.describe '/bike', type: :request do
  describe 'GET /index' do
    it 'renders a successful response' do
      Bike.create!(name: 'Bike', bike_type: 'Mountain', description: 'This is a bike', brand: 'Trek', daily_rate: 10,
                   images: { blue: 'sdas' }, color: ['sdas'])
      get api_v1_bikes_path
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      bike = Bike.create!(name: 'Bike', bike_type: 'Mountain', description: 'This is a bike', brand: 'Trek',
                          daily_rate: 10, images: { blue: 'sdas' }, color: ['sdas'])
      get api_v1_bike_path(bike)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the new bike' do
        post api_v1_bikes_path,
             params: { bike: { name: nil, bike_type: nil, description: nil, brand: nil, daily_rate: nil, images: nil,
                               color: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
