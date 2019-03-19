class Store < ApplicationRecord
    #associations
    has_many :assignments
    has_many :employees, through: :assignments 
    
    #validations
    validates :name, :zip, :street, presence: true
    validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }, allow_nil: true
    validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }, allow_nil: true
    validates :phone, format: { with: /(^[\d -]+$)/}, allow_nil: true
    validates :zip, format: { with: /\b\d{5}\b/}
    validates :state, format: { with: /(PA)|(OH)|(WV)/}, allow_nil: true
    validates :name, uniqueness: true
    
    #scopes
    scope :alphabetically, -> { order('name ASC') }
end
