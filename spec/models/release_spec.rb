# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Release do
  let(:cashier) { FactoryGirl.create :cashier }
  
  # Relationships
  it {should belong_to (:cashier)}

  # Validations
  it {should validate_presence_of (:value)}
  it {should validate_presence_of (:description)}
  it {should validate_presence_of (:doc_number)}
  it {should ensure_inclusion_of(:form_payment).in_array(["Cartao", "Dinheiro", "Boleto", "Cheque"]) }
  it {should ensure_inclusion_of(:doc_type).in_array(["Recibo", "Cupom Fiscal", "Nota Fiscal"]) }
  it {should have_a_valid_factory}

  # Methods
  it "verifying opening_balance" do
  	expect(cashier.opening_balance) == 0
  end

  
end
