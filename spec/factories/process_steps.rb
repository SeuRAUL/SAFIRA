# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :process_step do

    description "process_step description"
    name "process_step name"
    open_date "2013-08-02"
    consolidated_at "2013-08-02"
    consolidated "false"
    order_number 12345
    selection_process { FactoryGirl.build(:selection_process) }
    created_at Date.today
    updated_at Date.today
    selection_process_id 1
    
  end
end
