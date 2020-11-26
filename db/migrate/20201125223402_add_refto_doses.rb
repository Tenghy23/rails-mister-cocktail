class AddReftoDoses < ActiveRecord::Migration[6.0]
  def change
    remove_column :doses, :ingredient_id, :integer
    remove_column :doses, :cocktail_id, :integer
    add_reference :doses, :ingredient, foreign_key: true
    add_reference :doses, :cocktail, foreign_key: true
  end
end
