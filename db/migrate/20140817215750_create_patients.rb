class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
    	t.column :name, :string
    	t. column :doctor_id, :integer
    end
  end
end
