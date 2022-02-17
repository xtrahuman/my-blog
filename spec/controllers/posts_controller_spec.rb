require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:example) { get '/users/:user_id/posts' }
    it 'check post status' do
      expect(response).to have_http_status(:ok)
    end
    it 'render a template' do
      expect(response).to render_template('posts/index')
    end
    it 'renders body placeholder' do
      expect(response.body).to include('all posts from a user')
    end
  end
  describe 'GET /show' do
    before(:each) { get '/users/:user_id/posts/:id' }

    it 'http status to be ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'render a post template' do
      expect(response).to render_template('posts/show')
    end

    it 'show correct place holder' do
      expect(response.body).to include('single post details for a user')
    end
  end
end
