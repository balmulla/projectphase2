require './test/sets/store_contexts'
require './test/sets/employee_contexts'
require './test/sets/assignment_contexts'

module Contexts 
   include Contexts::AssignmentContexts
   include Contexts::EmployeeContexts
   include Contexts::StoreContexts
end