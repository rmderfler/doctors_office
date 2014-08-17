class Doctor < ActiveRecord::Base
  has_many :patients
  has_many :appointments
  validates :name, :presence => true
  validates :name, :uniqueness => true
  before_save :capital_case_name

    private

  def capital_case_name
    self.name = self.name.capitalize
  end

end