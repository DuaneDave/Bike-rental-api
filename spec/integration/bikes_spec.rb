require 'swagger_helper'

describe 'Bikes API' do
  path '/api/v1/bikes' do
    post 'Creates a bike' do
      tags 'Bikes'
      consumes 'application/json', 'application/xml'
      parameter name: :bike, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          bike_type: { type: :string },
          description: { type: :string },
          brand: { type: :string },
          daily_rate: { type: :decimal },
          images: { type: :hstore },
          color: { type: :array }
        },
        required: %w[name bike_type description brand daily_rate images color]
      }

      response '201', 'bike created' do
        let(:bike) do
          { name: 'Bike', bike_type: 'Mountain', description: 'This is a bike', brand: 'Trek', daily_rate: 10.0,
            images: { blue: 'da' }, color: ['abc'] }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:bike) { { name: 'foo' } }
        run_test!
      end
    end

    get 'Retrieves bikes' do
      tags 'Bikes'
      produces 'application/json', 'application/xml'

      response '200', 'bikes found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   bike_type: { type: :string },
                   description: { type: :string },
                   brand: { type: :string },
                   daily_rate: { type: :decimal },
                   images: { type: :hstore },
                   color: { type: :array }
                 }
               }
        run_test!
      end
    end

    path '/api/v1/bikes/{id}' do
      delete 'Deletes bike' do
        tags 'Bikes'
        produces 'application/json', 'application/xml'
        response '204', 'bikes deleted' do
          schema type: :array,
                 items: {
                   type: :object,
                   properties: {
                     id: { type: :integer },
                     name: { type: :string },
                     bike_type: { type: :string },
                     description: { type: :string },
                     brand: { type: :string },
                     daily_rate: { type: :decimal },
                     images: { type: :hstore },
                     color: { type: :array }
                   }
                 }
          run_test!
        end
      end
    end
  end
end
