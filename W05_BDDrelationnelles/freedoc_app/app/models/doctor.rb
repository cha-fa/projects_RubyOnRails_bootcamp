class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :join_specialty_doctors
  has_many :specialties, through: :join_specialty_doctors
  belongs_to :city
end
