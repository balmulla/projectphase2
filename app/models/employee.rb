class Employee < ApplicationRecord
    has_many :assignments
    has_many :stores, through: :assignments 
    
    validates :first_name, :last_name, :date_of_birth, :role, :ssn, presence: true
    
end
