class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.column :doctor_id, :integer
      t.column :patient_id, :integer
      t.column :datetime, :datetime
    end
  end
end
