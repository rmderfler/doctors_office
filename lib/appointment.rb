class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient

  scope :weeks_appointments, ->(date) { where("datetime >= ? AND datetime <= ?",
        date, date+7.days).order(:datetime) }

end