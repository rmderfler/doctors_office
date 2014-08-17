require 'active_record'
require './lib/doctor'
require './lib/patient'
require './lib/appointment'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def menu
  system 'clear'
  puts "Welcome to the doctors' office!"
  choice = nil
  until choice == '0'
    puts "1: add a doctor"
    puts "2: list doctors"
    puts "3: delete a doctor"
    puts "4: edit a doctor's name"
    puts "5: add a patient"
    puts "0: exit"

    choice = gets.chomp
    case choice
      when '1' then add_doctor
      when '2' then list_doctors
      when '3' then delete_doctor
      when '4' then edit_doctor
      when '5' then add_patient
      when '0' then exit
      else
        puts "This is not a valid option"
    end
  end
end

def add_doctor
  puts "What is the name of the doctor to add?"
  doctor = Doctor.create(:name => gets.chomp)
  if doctor.save
    puts "Dr. #{doctor.name} has been added."
  else
    puts "That's not a valid name."
  end
end

def list_doctors
  Doctor.all.each { |doctor| puts "Dr. " + doctor.name + ", id# " + doctor.id.to_s }
end

def edit_doctor
  list_doctors
  puts "What is the name doctor would you like to edit?  (exclude the letters 'Dr.')"
  name = gets.chomp
  doctor = Doctor.find_by(:name => name)
  puts "What is the doctor's new name?"
  doctor.update(:name => gets.chomp)
end

def delete_doctor
  list_doctors
  puts "What is the name doctor would you like to delete?  (exclude the letters 'Dr.')"
  name = gets.chomp
  doctor = Doctor.find_by(:name => name)
  doctor.delete
end


def add_patient
  puts "What is the name of the patient to add?"
  name = gets.chomp
  patient = Patient.create(:name => name)
  if patient.save
    puts "#{patient.name} has been added."
  else
    puts "That's not a valid name."
    menu
  end
  puts "What is the name of the patient's doctor?  (exclude the letters 'Dr.')"
  list_doctors
  doctor_name = gets.chomp
  doctor = Doctor.find_by(:name => doctor_name)
  patient.update(:doctor_id => doctor.id)
  puts "#{patient.name} with Dr. #{doctor.name} has been added."
end

menu