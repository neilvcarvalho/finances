class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :description
      t.integer :amount
      t.references :account, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
