require 'rails_helper'

RSpec.describe "Perfumes", type: :request do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  describe "GET /index" do
    it 'gets a list of perfumes' do 
      perfume = user.perfumes.create(
        name: "Accident À La Vanille",
        designer: "Jousset Parfums",
        category: "Gourmand",
        top_notes: "Vanilla",
        middle_notes: "Vanilla, Sandalwood",
        base_notes: "Vanilla, Styrax",
        image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg"    
      )

      get '/perfumes'

      perfume = JSON.parse(response.body)
      expect(perfume.first['name']).to eq("Accident À La Vanille")
      expect(perfume.first['designer']).to eq("Jousset Parfums")
      expect(perfume.first['category']).to eq("Gourmand")
      expect(perfume.first['top_notes']).to eq("Vanilla")
      expect(perfume.first['middle_notes']).to eq("Vanilla, Sandalwood")
      expect(perfume.first['base_notes']).to eq("Vanilla, Styrax")
      expect(perfume.first['image']).to eq("https://fimgs.net/mdimg/perfume/375x500.68076.jpg")
      expect(response).to have_http_status(200)
    end
  end

  it 'creates a new perfume' do 
    perfume_params = {
      perfume: {
        name: "Accident À La Vanille",
        designer: "Jousset Parfums",
        category: "Gourmand",
        top_notes: "Vanilla",
        middle_notes: "Vanilla, Sandalwood",
        base_notes: "Vanilla, Styrax",
        image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg",
        user_id: user.id
      }
    }
    post '/perfumes', params: perfume_params

    expect(response).to have_http_status(200)
    json = JSON.parse(response.body)
    perfume = Perfume.first 
    expect(perfume['name']).to eq("Accident À La Vanille")
    expect(perfume['designer']).to eq("Jousset Parfums")
    expect(perfume['category']).to eq("Gourmand")
    expect(perfume['top_notes']).to eq("Vanilla")
    expect(perfume['middle_notes']).to eq("Vanilla, Sandalwood")
    expect(perfume['base_notes']).to eq("Vanilla, Styrax")
    expect(perfume['image']).to eq("https://fimgs.net/mdimg/perfume/375x500.68076.jpg")
    expect(perfume['user_id']).to eq(user.id)
  end

  it "doesn't create an perfume without a name" do
    perfume_params = {
      perfume: {
        designer: "Jousset Parfums",
        category: "Gourmand",
        top_notes: "Vanilla",
        middle_notes: "Vanilla, Sandalwood",
        base_notes: "Vanilla, Styrax",
        image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg",
        user_id: user.id
      }
    }
    post '/perfumes', params: perfume_params

    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['name']).to include "can't be blank"
  end

  it "doesn't create an perfume without a designer" do
    perfume_params = {
      perfume: {
        name: "Accident À La Vanille",
        category: "Gourmand",
        top_notes: "Vanilla",
        middle_notes: "Vanilla, Sandalwood",
        base_notes: "Vanilla, Styrax",
        image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg",
        user_id: user.id
      }
    }
    post '/perfumes', params: perfume_params

    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['designer']).to include "can't be blank"
  end 

  it "doesn't create an perfume without a category" do
    perfume_params = {
      perfume: {
        name: "Accident À La Vanille",
        designer: "Jousset Parfums",
        top_notes: "Vanilla",
        middle_notes: "Vanilla, Sandalwood",
        base_notes: "Vanilla, Styrax",
        image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg",
        user_id: user.id
      }
    }
    post '/perfumes', params: perfume_params

    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['category']).to include "can't be blank"
  end 

  it "doesn't create an perfume without top notes" do
    perfume_params = {
      perfume: {
        name: "Accident À La Vanille",
        designer: "Jousset Parfums",
        category: "Gourmand",
        middle_notes: "Vanilla, Sandalwood",
        base_notes: "Vanilla, Styrax",
        image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg",
        user_id: user.id
      }
    }
    post '/perfumes', params: perfume_params

    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['top_notes']).to include "can't be blank"
  end 

  it "doesn't create an perfume without middle notes" do
    perfume_params = {
      perfume: {
        name: "Accident À La Vanille",
        designer: "Jousset Parfums",
        category: "Gourmand",
        top_notes: "Vanilla",
        base_notes: "Vanilla, Styrax",
        image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg",
        user_id: user.id
      }
    }
    post '/perfumes', params: perfume_params

    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['middle_notes']).to include "can't be blank"
  end 

  it "doesn't create an perfume without base notes" do
    perfume_params = {
      perfume: {
        name: "Accident À La Vanille",
        designer: "Jousset Parfums",
        category: "Gourmand",
        top_notes: "Vanilla",
        middle_notes: "Vanilla, Sandalwood",
        image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg",
        user_id: user.id
      }
    }
    post '/perfumes', params: perfume_params

    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['base_notes']).to include "can't be blank"
  end 

  it "doesn't create an perfume without a image" do
    perfume_params = {
      perfume: {
        name: "Accident À La Vanille",
        designer: "Jousset Parfums",
        category: "Gourmand",
        top_notes: "Vanilla",
        middle_notes: "Vanilla, Sandalwood",
        base_notes: "Vanilla, Styrax",
        user_id: user.id
      }
    }
    post '/perfumes', params: perfume_params

    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['image']).to include "can't be blank"
  end 

  it "doesn't create an perfume without a user id" do
    perfume_params = {
      perfume: {
        name: "Accident À La Vanille",
        designer: "Jousset Parfums",
        category: "Gourmand",
        top_notes: "Vanilla",
        middle_notes: "Vanilla, Sandalwood",
        base_notes: "Vanilla, Styrax",
        image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg",
      }
    }
    post '/perfumes', params: perfume_params

    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['user_id']).to include "can't be blank"
  end

  describe "PATCH /update" do
    it "updates a perfume" do
      perfume_params = {
        perfume: {
          name: "Accident À La Vanille",
          designer: "Jousset Parfums",
          category: "Gourmand",
          top_notes: "Vanilla",
          middle_notes: "Vanilla, Sandalwood",
          base_notes: "Vanilla, Styrax",
          image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg",
          user_id: user.id
        }
      }
      post '/perfumes', params: perfume_params
  
      updated_perfume_params = {
        perfume: {
          name: "Poets of Berlin",
          designer: "Vilhelm Parfumerie",
          category: "Woody",
          top_notes: "Blueberry, Lemon",
          middle_notes: "Bamboo, Orris",
          base_notes: "Vanilla, Sandalwood, Vetiver",
          image: "https://fimgs.net/mdimg/perfume/375x500.49306.jpg"
        }
      }
      perfume = Perfume.first
      
      patch "/perfumes/#{perfume.id}", params: updated_perfume_params

      expect(response).to have_http_status(200)
  
      updated_perfume = Perfume.first
      
      expect(updated_perfume.name).to eq('Poets of Berlin')
      expect(updated_perfume.designer).to eq('Vilhelm Parfumerie')
      expect(updated_perfume.category).to eq('Woody')
      expect(updated_perfume.top_notes).to eq("Blueberry, Lemon")
      expect(updated_perfume.middle_notes).to eq("Bamboo, Orris")
      expect(updated_perfume.base_notes).to eq("Vanilla, Sandalwood, Vetiver")
      expect(updated_perfume.image).to eq("https://fimgs.net/mdimg/perfume/375x500.49306.jpg")
    end

    it 'returns a 422 status code' do
      perfume_params = {
        perfume: {
          name: "Accident À La Vanille",
          designer: "Jousset Parfums",
          category: "Gourmand",
          top_notes: "Vanilla",
          middle_notes: "Vanilla, Sandalwood",
          base_notes: "Vanilla, Styrax",
          image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg",
          user_id: user.id
        }
      }
      post '/perfumes', params: perfume_params

      invalid_perfume_params = {
        perfume: {
          name: nil,
          designer: nil,
          category: nil,
          top_notes: nil,
          middle_notes: nil,
          base_notes: nil,
          image: nil
        }
      }

      perfume = Perfume.first
      patch "/perfumes/#{perfume.id}", params: invalid_perfume_params

      expect(response).to have_http_status(422)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a perfume' do
      perfume = Perfume.create(
        name: "Accident À La Vanille",
        designer: "Jousset Parfums",
        category: "Gourmand",
        top_notes: "Vanilla",
        middle_notes: "Vanilla, Sandalwood",
        base_notes: "Vanilla, Styrax",
        image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg",
        user_id: user.id
      )

      delete "/perfumes/#{perfume.id}"

      expect(response).to have_http_status(200)
      expect(Perfume.find_by(id: perfume.id)).to be_nil
    end
  end
end
