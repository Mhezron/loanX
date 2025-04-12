class RenameCustomerIdColumnInLoans < ActiveRecord::Migration[8.0]
  def change
    remove_index :loans, name: "index_loans_on_Customer_id"
    rename_column :loans, :Customer_id, :customer_id
    add_index :loans, :customer_id
  end
end
