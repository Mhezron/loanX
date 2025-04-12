class CreatePhones < ActiveRecord::Migration[8.0]
  def change
    create_table :phones do |t|
      t.references :Loan, null: false, foreign_key: true
      t.string :phone_make
      t.string :phone_model
      t.string :code

      t.timestamps
    end
  end
end
