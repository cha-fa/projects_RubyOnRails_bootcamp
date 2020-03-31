class CreateJoinSpecialtyDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :join_specialty_doctors do |t|
      t.belongs_to :specialty, index: true
      t.belongs_to :doctor, index: true
      remove_column :doctors, :specialty

      t.timestamps
    end
  end
end