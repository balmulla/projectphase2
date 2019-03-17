class Store < ApplicationRecord
    #associations
    has_many :assignments
    has_many :employees, through: :assignments 
    
    #validations
    validates :name, :zip, :street, presence: true
    validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
    validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
    validates :phone, format: { with: /(^[\d -]+$)/}    
    validates :zip, format: { with: /\b\d{5}\b/}
    validates :state, format: { with: /(PA)|(OH)|(WV)/}
    validates :name, uniqueness: true
end
