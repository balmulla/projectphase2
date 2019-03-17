class Assignment < ApplicationRecord
    #associations
    belongs_to :employee
    belongs_to :store
    #validations
    validates :store_id, :employee_id, :start_date, :pay_level,  presence: true
    validates_datetime :start_date
    validates_datetime :end_date
    validates :pay_level, numericality: { only_integer: true }
    
end
