require 'rails_helper'
require 'jwt'
require 'pp'

describe Api::V1::Users::SessionsController, type: :request do

  let (:user) { create_user }
  let (:login_url) { '/api/v1/login' }
  let (:logout_url) { '/api/v1/logout' }

  context 'When logging in' do
    before do
      login_with_api(user)
    end

    it 'returns a token' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end

  context 'When password is missing' do
    before do
      post login_url, params: {
        user: {
          email: user.email,
          password: nil
        }
      }
    end

    it 'returns 401' do
      expect(response.status).to eq(401)
    end

  end

  context 'When logging out' do
    before do
      @res = login_with_api(user)
      @token = @res.headers['Authorization']
    end

    it 'returns 200' do
      delete logout_url, headers: {
        Authorization: @token
      }

      expect(response).to have_http_status(200)
    end

    it 'returns 401' do
    delete logout_url, headers: {
      Authorization: 'Bearer ey3425432423.jlfdasfasdfasdfasdfsdafsad.kjasdfkjhlkjlkl.jowkljkljlkjj;leoj'
    }

    expect(response).to have_http_status(401)
    end
  end

end