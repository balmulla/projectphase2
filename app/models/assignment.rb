class Assignment < ApplicationRecord
    #associations
    belongs_to :employee
    belongs_to :store
    #validations
    validates :store_id, :employee_id, :start_date, :pay_level,  presence: true
    validates_datetime :start_date
    validates_datetime :end_date, allow_nil: true
    validates :pay_level, numericality: { only_integer: true }
    #scopes
    scope :chronological, -> { order('start_date DESC') }
    scope :current, -> { where('end_date IS NULL') }
    scope :past, -> { where('end_date IS NOT NULL') }
    scope :for_store, -> (s) { where('store_id = ?', s)}
    scope :for_employee, -> (e) { where('employee_id = ?', e)}
    scope :for_pay_level, -> (p) { where('pay_level = ?', p)}
    scope :for_role, -> (r) { joins(:employee).where('employees.role = ?', r)}
    scope :by_store, -> { joins(:store).order('stores.name ASC')}
    scope :by_employee, -> { joins(:employee).order('employees.last_name ASC, employees.first_name ASC')}
    
end
