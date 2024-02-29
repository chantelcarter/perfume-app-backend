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
end
