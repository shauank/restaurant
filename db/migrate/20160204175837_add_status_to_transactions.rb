class AddStatusToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :status, :string
  end
end
