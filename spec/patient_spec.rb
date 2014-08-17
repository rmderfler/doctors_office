require 'spec_helper'

describe Patient do

  it "validates presence of name" do
    patient = Patient.new({:name => ''})
    expect(patient.save).to eq false
  end

  it "requires a unique name" do
    patient = Patient.new({:name => 'A'}).save
    patient_2 = Patient.new({:name => 'A'})
    expect(patient_2.save).to eq false
  end

  it "capitalizes the name" do
    patient = Patient.new(:name => 'detroit')
    patient.save
    expect(patient.name).to eq "Detroit"
  end
end