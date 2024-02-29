require 'rails_helper'

RSpec.describe Perfume, type: :model do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }
  it 'should validate name' do
    perfume = user.perfumes.create(
      designer: "Jousset Parfums",
      category: "Gourmand",
      top_notes: "Vanilla",
      middle_notes: "Vanilla, Sandalwood",
      base_notes: "Vanilla, Styrax",
      image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg"
    )
    expect(perfume.errors[:name]).to include("can't be blank")
  end

  it 'should validate designer' do
    perfume = user.perfumes.create(
      name: "Accident À La Vanille",
      category: "Gourmand",
      top_notes: "Vanilla",
      middle_notes: "Vanilla, Sandalwood",
      base_notes: "Vanilla, Styrax",
      image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg"
    )
    expect(perfume.errors[:designer]).to include("can't be blank")
  end

  it 'should validate category' do
    perfume = user.perfumes.create(
      name: "Accident À La Vanille",
      designer: "Jousset Parfums",
      top_notes: "Vanilla",
      middle_notes: "Vanilla, Sandalwood",
      base_notes: "Vanilla, Styrax",
      image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg"
    )
    expect(perfume.errors[:category]).to include("can't be blank")
  end

  it 'should validate top notes' do
    perfume = user.perfumes.create(
      name: "Accident À La Vanille",
      designer: "Jousset Parfums",
      category: "Gourmand",
      middle_notes: "Vanilla, Sandalwood",
      base_notes: "Vanilla, Styrax",
      image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg"
    )
    expect(perfume.errors[:top_notes]).to include("can't be blank")
  end

  it 'should validate middle notes' do
    perfume = user.perfumes.create(
      name: "Accident À La Vanille",
      designer: "Jousset Parfums",
      category: "Gourmand",
      top_notes: "Vanilla",
      base_notes: "Vanilla, Styrax",
      image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg"
    )
    expect(perfume.errors[:middle_notes]).to include("can't be blank")
  end

  it 'should validate base notes' do
    perfume = user.perfumes.create(
      name: "Accident À La Vanille",
      designer: "Jousset Parfums",
      category: "Gourmand",
      top_notes: "Vanilla",
      middle_notes: "Vanilla, Sandalwood",
      image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg"
    )
    expect(perfume.errors[:base_notes]).to include("can't be blank")
  end

  it 'should validate image' do
    perfume = user.perfumes.create(
      name: "Accident À La Vanille",
      designer: "Jousset Parfums",
      category: "Gourmand",
      top_notes: "Vanilla",
      middle_notes: "Vanilla, Sandalwood",
      base_notes: "Vanilla, Styrax"
    )
    expect(perfume.errors[:image]).to include("can't be blank")
  end

  it 'should validate user id' do
    perfume = Perfume.create(
      name: "Accident À La Vanille",
      designer: "Jousset Parfums",
      category: "Gourmand",
      top_notes: "Vanilla",
      middle_notes: "Vanilla, Sandalwood",
      base_notes: "Vanilla, Styrax",
      image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg"
    )
    expect(perfume.errors[:user_id]).to include("can't be blank")
  end
end
