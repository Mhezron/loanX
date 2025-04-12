class CreateLoans < ActiveRecord::Migration[8.0]
  def change
    create_table :loans do |t|
      t.references :Customer, null: false, foreign_key: true
      t.decimal :loan_amount
      t.decimal :interest
      t.decimal :repayment_amount
      t.date :repayment_date

      t.timestamps
    end
  end
end
