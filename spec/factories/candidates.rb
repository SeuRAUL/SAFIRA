# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :candidate do
    name "MyString"
    description "MyText"
    curriculum File.new(Rails.root + 'spec/support/curriculumTest.pdf')
    email "email@email.com"
    course "MyString"
    selection_process { FactoryGirl.build(:selection_process) }
  end
end
