class AddDescriptionAndPhotoToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :description, :text
    add_column :products, :photo, :string
  end
end
