class RenameLoanIdColumnInPhones < ActiveRecord::Migration[8.0]
  def change
    remove_index :phones, name: "index_phones_on_Loan_id"
    rename_column :phones, :Loan_id, :loan_id
    add_index :phones, :loan_id
  end
end
