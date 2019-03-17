class Store < ApplicationRecord
    #associations
    has_many :assignments
    has_many :employees, through: :assignments 
    
    #validations
    validates :name, :zip, :street, presence: true
end
