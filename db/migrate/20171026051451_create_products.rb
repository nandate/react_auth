class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.string :term
      t.string :region
      t.integer :seller_id
      t.integer :borrower_id
      t.boolean :is_rent, default: false
      t.boolean :is_return, default: false

      t.timestamps
    end

    add_index :products, :seller_id
    add_index :products, :borrower_id
  end
end
