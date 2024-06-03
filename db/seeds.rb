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
  },
  {
    name: "Pink Boa",
    designer: "Stéphane Humbert Lucas 777",
    category: "Fruity",
    top_notes: "Rosemary, Bergamot, Blackcurrant",
    middle_notes: "Vodka, Raspberry, Basil",
    base_notes: "Patchouli, Amber, Olibanum, Musk",
    image: "https://fimgs.net/mdimg/perfume/375x500.75021.jpg"
  },
  {
    name: "Chocolate Greedy",
    designer: "Montale",
    category: "Gourmand",
    top_notes: "Bitter Orange, Dried Fruits",
    middle_notes: "Cocao, Coffee Bean",
    base_notes: "Tonka Bean, Vanilla",
    image: "https://fimgs.net/mdimg/perfume/375x500.2186.jpg"
  },
  {
    name: "Instant Crush",
    designer: "Mancera",
    category: "Floral",
    top_notes: "Saffron, Ginger, Sicilian Mandarin, Sicilian Bergamot",
    middle_notes: "Amberwood, Moroccan Rose, Egyptian Jasmine, Indonesian Patchouli Leaf",
    base_notes: "Madagascar Vanilla, White Musk, Sandalwood, Oakmoss",
    image: "https://fimgs.net/mdimg/perfume/375x500.54885.jpg"
  },
  {
    name: "Blanche",
    designer: "Byredo",
    category: "Floral",
    top_notes: "Aldehydes, Rose, Pink Pepper",
    middle_notes: "Peony, Violet, African Orange Flower",
    base_notes: "Musk, Woodsy Notes, Sandalwood",
    image: "https://fimgs.net/mdimg/perfume/375x500.6686.jpg"
  },
  {
    name: "Poets of Berlin",
    designer: "Vilhelm Parfumerie",
    category: "Fruity",
    top_notes: "Blueberry, Lemon",
    middle_notes: "Bamboo, Orris",
    base_notes: "Vanilla, Sandalwood, Vetiver",
    image: "https://fimgs.net/mdimg/perfume/375x500.49306.jpg"
  },
  {
    name: "Gentle Fluidity Gold",
    designer: "Maison Francis Kurkdjian",
    category: "Vanilla",
    top_notes: "Juniper Berries, Nutmeg, Coriander",
    middle_notes: "Musk, Vanilla, Amber",
    base_notes: "Vetiver, Woods, Vanilla",
    image: "https://fimgs.net/mdimg/perfume/375x500.53401.jpg"
  },
  {
    name: "Buontalenti",
    designer: "Profumo di Firenze",
    category: "Vanilla",
    top_notes: "Banana, Apricot, Peach, Red Fruits",
    middle_notes: "Coconut, Vanilla, Raspberry",
    base_notes: "Cookie, Toffee, Caramel, Musk",
    image: "https://fimgs.net/mdimg/perfume/375x500.57112.jpg"
  },
  {
    name: "Bianco Latte Limited Edition",
    designer: "Giardini Di Toscana",
    category: "Gourmand",
    top_notes: "Caramel",
    middle_notes: "Coumarin, Honey",
    base_notes: "Vanilla, White Musk",
    image: "https://fimgs.net/mdimg/perfume/375x500.88107.jpg"
  },
  {
    name: "Escapade Gourmande",
    designer: "Maison Mataha",
    category: "Gourmand",
    top_notes: "Sugar Cane",
    middle_notes: "Vanilla, Tonka Bean",
    base_notes: "Benzoin, White Musk",
    image: "https://fimgs.net/mdimg/perfume/375x500.72607.jpg"
  },
  {
    name: "Bal d'Afrique",
    designer: "Byredo",
    category: "Woody",
    top_notes: "Almafi Lemon, Tegetes, Black Currant, Bergamot, African Orange Flower",
    middle_notes: "Violet, Cyclamen, Jasmine",
    base_notes: "Vetiver, Musk, Amber, Virginia Cedar",
    image: "https://fimgs.net/mdimg/perfume/375x500.6458.jpg"
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
  },
  {
    name: "Cassili",
    designer: "Parfums de Marly",
    category: "Fruity",
    top_notes: "Red Currant, Bulgarian Rose, Transparent White Flowers",
    middle_notes: "Plum Accord, Mimosa Absolute, Plumeria, Petalia",
    base_notes: "Sandalwood, Tonka Beans, Vanilla Pod",
    image: "https://fimgs.net/mdimg/perfume/375x500.54660.jpg"
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