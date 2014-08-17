About: This program stores doctors' names, patients' names, and appointments.

Dependencies: rspec, postgresql, Active Record.

Set-up: There are three tables: 
  doctors table - name, specialty, serial id.  doctor 'has_many :patients'
  patients table - name, serial id.  patient 'belongs_to :doctor'
  appointments table - datetime, doctor_id, patient_id.  appointment 'belongs_to :doctor', 'belongs_to :patient'

