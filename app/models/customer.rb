class Customer < ApplicationRecord
  has_many :loans, dependent: :destroy
  accepts_nested_attributes_for :loans
  validates :first_name, :last_name, :id_number, :phone_number, :dob, presence: true
end
