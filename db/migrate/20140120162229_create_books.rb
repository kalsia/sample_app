class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.date :release_date
      t.integer :n_pages
      t.string :image_url
      t.string :isbn
      t.text :description
      t.integer :user_id

      t.timestamps
    end
    add_index :books, [:user_id, :created_at]
  end
end
