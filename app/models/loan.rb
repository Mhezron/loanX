class Loan < ApplicationRecord
  validates :loan_amount, presence: true, numericality: { greater_than: 0 }
  belongs_to :customer
  has_one :phone, dependent: :destroy
  accepts_nested_attributes_for :phone



  before_save :calculate_repayment_amount
  before_create :set_repayment_date
  before_save :calculate_interest
  before_validation :set_default_status, on: :create


  private
  def set_default_status
    self.status ||= :pending
  end

  def calculate_repayment_amount
    return unless loan_amount.present?

    self.repayment_amount = loan_amount + (loan_amount * 0.20)
  end

  def set_repayment_date
    self.repayment_date ||= Date.today + 30.days
  end

  def calculate_interest
    self.interest = repayment_amount - loan_amount
  end
end
