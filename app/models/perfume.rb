class Perfume < ApplicationRecord
  belongs_to :user
  validates :name, :designer, :category, :top_notes, :middle_notes, :base_notes, :image, :user_id, presence: true
end
