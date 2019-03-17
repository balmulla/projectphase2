class Employee < ApplicationRecord
    #associations
    has_many :assignments
    has_many :stores, through: :assignments 
    
    #validations
    validates :first_name, :last_name, :date_of_birth, :role, :ssn, presence: true
    validates_datetime :date_of_birth
    
end
