class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.string :description, null: false
      t.integer :amount, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.boolean :result
      t.string :status, null: false
      t.integer :max_users, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
