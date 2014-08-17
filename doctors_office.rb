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
    puts "0: exit"

    choice = gets.chomp
    case choice
      when '1' then add_doctor
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

menu