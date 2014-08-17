class Patient < ActiveRecord::Base
  belongs_to :doctor
  validates :name, :presence => true, :uniqueness => true
  before_save :capital_case_name
  has_many :appointments

  private

  def capital_case_name
    self.name = self.name.capitalize
  end
end