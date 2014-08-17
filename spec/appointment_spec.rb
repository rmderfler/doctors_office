require 'spec_helper'

describe Appointment do

  it "creates a new appointment with a date and time, patient id and doctor id" do
    appointment = Appointment.new({:datetime => '2014-08-18 09:00', :doctor_id => 1, :patient_id => 1})
    expect(appointment).to be_a  Appointment
  end

end