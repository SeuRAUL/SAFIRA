# -*- utf-8 -*-
class Release < ActiveRecord::Base
  attr_accessible :date_release, :description, :doc_number, :doc_type, :form_payment, :origin_destination, :type_release, :value
  
  possible_form_payment = ["Cartao", "Dinheiro", "Boleto", "Cheque"]
  possible_doc_type = ['Exemplo 1', 'Exemplo 2']

  validates :value, presence: true, numericality: true #, message: "Precisa constar o valor da nota."
  validates :description, presence: true #, message: "Precisa constar a descrição da nota."
  validates :doc_number, presence: true, uniqueness: true #, message: "Precisa constar o numero do documento."
  #validates :form_payment, inclusion_of: possible_form_payment
  #validates :doc_type, inclusion_of: possible_doc_type

  belongs_to :cashier

  before_save :update_cashier

  def update_cashier
  	c = Cashier.find(self.cashier_id)
    c.opening_balance += self.value
    c.save
  end

end
