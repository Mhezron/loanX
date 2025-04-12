class Loan < ApplicationRecord
  belongs_to :customer
  has_one :phone, dependent: :destroy
  accepts_nested_attributes_for :phone

  before_save :calculate_repayment_amount
  before_create :set_repayment_date

  private

  def calculate_repayment_amount
    return unless loan_amount.present?

    self.repayment_amount = loan_amount + (loan_amount * 0.20)
  end

  def set_repayment_date
    self.repayment_date ||= Date.today + 30.days
  end
end
