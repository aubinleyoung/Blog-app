require 'rails_helper'

RSpec.describe 'UsersControllers', type: :request do
  before(:each) do
    @user = User.create(name: 'John Doe', photo: 'https://picsum.photos/200/300', bio: 'I am John Doe')
  end
  describe 'GET /index' do
    it 'returns a success response' do
      get '/users'
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get '/users'
      expect(response).to render_template('index')
    end

    it 'response body includes the correct content' do
      get '/users'
      expect(response.body).to include('<h1 class="title">List of all users:</h1>')
    end
  end

  describe 'GET show' do
    it 'returns a success response' do
      get "/users/#{@user.id}"
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get user_path(@user)
      expect(response).to render_template(:show)
    end
    it 'response body includes the correct content' do
      get user_path(@user)
      expect(response.body).to include('<h1 class="title">This is single user</h1>')
    end
  end
end
