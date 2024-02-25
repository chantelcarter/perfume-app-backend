class CreatePerfumes < ActiveRecord::Migration[7.1]
  def change
    create_table :perfumes do |t|
      t.string :name
      t.string :designer
      t.string :category
      t.text :top_notes
      t.text :middle_notes
      t.text :base_notes
      t.text :image
      t.integer :user_id

      t.timestamps
    end
  end
end
