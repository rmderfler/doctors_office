require 'spec_helper'

describe Doctor do

  it "validates presence of a name" do
    doctor = Doctor.new({:name => ''})
    expect(doctor.save).to eq false
  end

  it "requires a unique a name" do
    doctor = Doctor.new({:name => 'A'}).save
    doctor_2 = Doctor.new({:name => 'A'})
    expect(doctor_2.save).to eq false
  end

  it "capitalizes the name" do
    doctor = Doctor.new(:name => 'detroit')
    doctor.save
    expect(doctor.name).to eq "Detroit"
  end

end