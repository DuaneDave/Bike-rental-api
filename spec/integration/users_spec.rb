require 'swagger_helper'

describe 'Users API' do
  path '/api/v1/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json', 'application/xml'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[name email password]
      }

      response '201', 'user created' do
        let(:user) { { name: 'haaadii', email: 'email21@gmail.com', password: 'Password' } }
        run_test!
      end
    end

    get 'Retrieves users' do
      tags 'Users'
      produces 'application/json', 'application/xml'

      response '200', 'users found' do
        schema type: :array,
              items: {
                type: :object,
                properties: {
                  id: { type: :integer },
                  name: { type: :string },
                  email: { type: :string },
                  password: { type: :string },
                  created_at: { type: :string },
                  updated_at: { type: :string }
                }
              }
        run_test!
      end
    end

    path '/api/v1/users/{id}' do
      delete 'Deletes user' do
        tags 'Users'
        produces 'application/json', 'application/xml'
        response '204', 'users deleted' do
          schema type: :array,
                items: {
                  type: :object,
                  properties: {
                    id: { type: :integer },
                    name: { type: :string },
                    email: { type: :string },
                    password_digest: { type: :string },
                    created_at: { type: :string },
                    updated_at: { type: :string }
                  }
                }
          run_test!
        end
      end
    end
  end
end
