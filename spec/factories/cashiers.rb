# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cashier do |c|
	c.opening_balance 0.0
	enterprise { FactoryGirl.build(:four_soft) }
  end
end
