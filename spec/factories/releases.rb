# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :release do |r| 
    r.type_release "Entrada"
    r.value 10.2
    r.description "MyText"
    r.form_payment "Cartao"
    r.date_release "2013-10-21"
    r.doc_number 1
    r.doc_type "Recibo"
    r.origin_destination "Origem"
    r.association :cashier

  end
end
