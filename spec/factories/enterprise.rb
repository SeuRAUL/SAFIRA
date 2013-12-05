# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :enterprise do
    sequence(:name) { |i| "Enterprise #{i}m" }
    sequence(:email) { |i| "enterprise#{i}@4soft.com" }
    password '12345678'

    factory :four_soft do
      email '4soft@4soft.com'
      name '4Soft'
      about 'Lorem ipsum'
    end
  end
end
