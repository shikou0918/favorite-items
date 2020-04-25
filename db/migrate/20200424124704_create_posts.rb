class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :content, null: false
      t.text :image, null: false
      t.timestamps
    end
  end
end
