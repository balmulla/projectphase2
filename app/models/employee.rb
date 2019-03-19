class Employee < ApplicationRecord
    #associations
    has_many :assignments
    has_many :stores, through: :assignments 
    
    #validations
    validates :first_name, :last_name, :date_of_birth, :role, :ssn, presence: true
    validates_datetime :date_of_birth
    validates :ssn, format: { with: /(\d{3}-\d{2}-\d{4})|(\d{9})/}
    validates :phone, format: { with: /(^[\d -]+$)/}, allow_nil: true
    
    #scopes
    scope :alphabetical, -> { order('first_name ASC') }
    scope :younger_than_18, -> { where('date_of_birth > ?', 18.years.ago.to_date) }
    scope :is_18_or_older, -> { where('date_of_birth <= ?', 18.years.ago.to_date) }
    scope :active, -> { where('active = ?', true) }
    scope :inactive, -> { where('active = ?', false) }
    scope :regulars, -> { where('role = ?', "employee") }
    scope :managers, -> { where('role = ?', "manager") }
    scope :admins, -> { where('role = ?', "admin") }
    
    #methods
    def name
        self.last_name+", "+self.first_name
    end
    
    def proper_name
        self.first_name+" "+self.last_name
    end
end
