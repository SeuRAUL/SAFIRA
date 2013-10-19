# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :release do    
    type_release false
    value 10.2
    description "MyText"
    form_payment 1
    date_release "2013-09-28"
    doc_number 1
    doc_type 1
    origin_destination 1
    cashier
  end
end
