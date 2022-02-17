require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:each) { get '/users' }
    it 'check users status' do
      expect(response).to have_http_status(:ok)
    end
    it 'render a template' do
      expect(response).to render_template('index')
    end
    it 'renders body placeholder' do
      expect(response.body).to include('all users')
    end
  end
  describe 'GET /show' do
    before(:each) { get '/users/:user_id' }

    it 'http status to be ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'render a user template' do
      expect(response).to render_template('show')
    end

    it 'show correct place holder' do
      expect(response.body).to include('a user info')
    end
  end
end
