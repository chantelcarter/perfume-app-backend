user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

user1_perfumes = [
  {
    name: "Accident À La Vanille",
    designer: "Jousset Parfums",
    category: "Gourmand",
    top_notes: "Vanilla",
    middle_notes: "Vanilla, Sandalwood",
    base_notes: "Vanilla, Styrax",
    image: "https://fimgs.net/mdimg/perfume/375x500.68076.jpg"
  }
]

user2_perfumes = [
  {
    name: "Roses Vanille",
    designer: "Mancera",
    category: "Gourmand",
    top_notes: "Italian Lemon",
    middle_notes: "Turkish Rose",
    base_notes: "Vanilla, White Musk, Cedar",
    image: "https://fimgs.net/mdimg/perfume/375x500.15210.jpg"
  }
]


user1_perfumes.each do |perfume|
  user1.perfumes.create(perfume)
  p "created: #{perfume}"
end

user2_perfumes.each do |perfume|
  user2.perfumes.create(perfume)
  p "created: #{perfume}"
end