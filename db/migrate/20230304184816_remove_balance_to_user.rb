class RemoveBalanceToUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :balance
  end
end
