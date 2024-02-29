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
end
