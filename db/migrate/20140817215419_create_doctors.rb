class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.column :name, :string
    end
  end
end
