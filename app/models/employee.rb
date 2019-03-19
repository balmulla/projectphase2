class Employee < ApplicationRecord
    #associations
    has_many :assignments
    has_many :stores, through: :assignments 
    
    #validations
    validates :first_name, :last_name, :date_of_birth, :role, :ssn, presence: true
    validates_datetime :date_of_birth
    validates :ssn, format: { with: /(\d{3}-\d{2}-\d{4})|(\d{9})/}
    validates :phone, format: { with: /(^[\d -]+$)/}, allow_nil: true
end
