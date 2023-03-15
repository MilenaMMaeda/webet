class AddUpdatedOnceToBets < ActiveRecord::Migration[7.0]
  def change
    add_column :bets, :updated_once, :boolean
  end
end
