class RemoveStatusFromLoan < ActiveRecord::Migration[8.0]
  def change
    remove_column :loans, :status, :integer
  end
end
