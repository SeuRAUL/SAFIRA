# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback do
    public "MyText"
    private "MyText"
    candidate { FactoryGirl.build(:candidate) }
    process_step { FactoryGirl.build(:process_step) }
    
  end
end
