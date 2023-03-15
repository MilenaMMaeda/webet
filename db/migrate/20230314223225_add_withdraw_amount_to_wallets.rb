class AddWithdrawAmountToWallets < ActiveRecord::Migration[7.0]
  def change
    add_column :wallets, :withdraw_amount, :integer
  end
end
