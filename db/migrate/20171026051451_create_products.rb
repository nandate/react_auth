class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.string :term
      t.string :region
      t.integer :rent_user_id
      t.boolean :is_rent, default: false
      t.boolean :is_return, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
