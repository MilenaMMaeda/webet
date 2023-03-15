class AddImageUrlToChips < ActiveRecord::Migration[7.0]
  def change
    add_column :chips, :image_url, :string
  end
end
