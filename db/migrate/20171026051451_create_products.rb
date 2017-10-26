class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.string :term
      t.boolean :islent
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
