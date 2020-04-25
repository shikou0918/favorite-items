class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.text :text, null: false
    end
  end
end
