# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :release do    
    type_release "Entrada"
    value 10.2
    description "MyText"
    form_payment "Cartao"
    date_release "2013-09-28"
    doc_number 1
    doc_type "Recibo"
    origin_destination "Origem"
    cashier
  end
end
