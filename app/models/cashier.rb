#encoding: utf-8
class Cashier < ActiveRecord::Base
  attr_accessible :opening_balance, :enterprise
  
  belongs_to :enterprise
  has_many :releases, dependent: :destroy
end
