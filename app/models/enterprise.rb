# -*- encoding : utf-8 -*-
class Enterprise < User
  attr_accessible :corporate_name

  after_create :init

  usar_como_cnpj :cnpj

  has_many :entrepreneurs
  has_many :selection_process
  has_one :cashier

  def init
  		cashier = Cashier.create opening_balance: 0.0, enterprise: self
  		cashier.save
  end
	 
end
