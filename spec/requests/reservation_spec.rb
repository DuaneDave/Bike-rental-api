require 'rails_helper'

RSpec.describe '/reservation', type: :request do
  describe 'GET /index' do
    it 'renders a successful response' do
      Reservation.create!(bike_id: 1, user_id: 1, reservation_date: '2021-03-01', due_date: '2021-03-03')
      get api_v1_reservations_path
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      reservation = Reservation.create!(bike_id: 1, user_id: 1, reservation_date: '2021-03-01',
                                        due_date: '2021-03-03')
      get api_v1_reservation_path(reservation)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the new reservation' do
        post api_v1_reservations_path,
             params: { reservation: { bike_id: nil, user_id: nil, reservation_date: nil, due_date: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
