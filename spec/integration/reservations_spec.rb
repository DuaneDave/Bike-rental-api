require 'swagger_helper'

describe 'Reservations API' do
  path '/api/v1/reservations' do
    post 'Creates a reservation' do
      tags 'Reservations'
      consumes 'application/json', 'application/xml'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          bike_id: { type: :integer },
          user_id: { type: :integer },
          reservation_date: { type: :string },
          due_date: { type: :string }
        },
        required: %w[bike_id user_id reservation_date due_date]
      }

      response '201', 'reservation created' do
        let(:reservation) do
          { bike_id: 1, user_id: 1, reservation_date: '2021-03-01', due_date: '2021-03-03' }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:reservation) { { bike_id: 1 } }
        run_test!
      end
    end

    get 'Retrieves reservations' do
      tags 'Reservations'
      produces 'application/json', 'application/xml'

      response '200', 'reservations found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   bike_id: { type: :integer },
                   user_id: { type: :integer },
                   reservation_date: { type: :string },
                   due_date: { type: :string }
                 }
               }
        run_test!
      end
    end
  end
end
