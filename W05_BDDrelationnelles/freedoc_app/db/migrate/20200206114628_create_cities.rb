class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :city_name
      add_reference :appointments, :city, foreign_key: true
      add_reference :doctors, :city, foreign_key: true
      add_reference :patients, :city, foreign_key: true
      t.timestamps
    end
  end
end
