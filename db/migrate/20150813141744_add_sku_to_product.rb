class AddSkuToProduct < ActiveRecord::Migration
  def change
    add_column :products, :SKU, :string
  end
end
