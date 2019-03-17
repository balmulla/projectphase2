class Employee < ApplicationRecord
    has_many :assignments
    has_many :stores, through: :assignments 
end
