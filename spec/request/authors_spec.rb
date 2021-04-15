# require 'rails-helper'
# Test rspec spec/request/authors_spec.rb:11 sesuai lines

describe 'Authors API', type: :request do
  describe 'GET /books' do
    it 'returns all authors' do
      get '/api/v1/authors'
        expect(response).to have_http_status(200)
    end
  end

  describe 'POST /authors' do
    it 'create a new author' do
      expect {
        post '/api/v1/authors', params: { author: {name: 'Tere Liye'}}
      }.to change { Author.count }.from(0).to(1)
      
      expect(response).to have_http_status(201)
    end
  end

end