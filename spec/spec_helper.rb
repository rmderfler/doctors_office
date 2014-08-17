require 'active_record'
require 'rspec'
require 'doctor'
require 'patient'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Doctor.all.each { |doctor| doctor.destroy }

  end
end
