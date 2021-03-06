# -*- encoding : utf-8 -*-
# -*- utf-8 -*-
class Release < ActiveRecord::Base
  attr_accessible :date_release, :description, :doc_number, :doc_type, :form_payment, :origin_destination, :type_release, :value
  
  POSSIBLE_FORM_PAYMENT = ["Cartao", "Dinheiro", "Boleto", "Cheque"]
  POSSIBLE_DOC_TYPE = ["Recibo", "Cupom Fiscal", "Nota Fiscal"]

  validates :value, presence: true, numericality: true #, message: "Precisa constar o valor da nota."
  validates :description, presence: true #, message: "Precisa constar a descrição da nota."
  validates :doc_number, presence: true, uniqueness: true #, message: "Precisa constar o numero do documento."
  validates :form_payment, :inclusion => { :in  => POSSIBLE_FORM_PAYMENT }
  validates :doc_type, :inclusion => { :in => POSSIBLE_DOC_TYPE}

  belongs_to :cashier

  before_create :update_cashier
  after_destroy :recount_cashier

  def update_cashier
  	c = Cashier.find(self.cashier_id)
    self.value *= -1 if self.value < 0

    if self.type_release == "Entrada"
      c.opening_balance += self.value
    else
      c.opening_balance -= self.value
    end
    c.save
  end

  def recount_cashier
    c = Cashier.find(self.cashier_id)
    if self.type_release == "Entrada"
      c.opening_balance -= self.value
    else
      c.opening_balance += self.value
    end
    c.save
  end 

end
