class Phone < ApplicationRecord
  belongs_to :loan

  before_create :generate_code

  private 
  def generate_code
    self.code ||= "JM-#{SecureRandom.hex(3)}"
  end
end
