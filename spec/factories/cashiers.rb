# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  # factory :cashier do
    # opening_balance 0.0
    # releases
    # enterprise
  factory :cashier do
	opening_balance 0.0
	releases nil
	enterprise FactoryGirl.build(:enterprise)
  end
end
