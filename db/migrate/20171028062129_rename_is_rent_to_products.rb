class RenameIsRentToProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :is_rent, :is_meet
  end
end
