# -*- encoding : utf-8 -*-
require "spec_helper"

describe CandidateMailer do
 
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
  end

  describe "#send_confirmation" do
    let(:mail) { CandidateMailer.send_confirmation(FactoryGirl.create(:selection_process), FactoryGirl.create(:candidate)).deliver }

    it "renders the headers" do
      mail.subject.should match("Cadastro confirmado")
      mail.to.should eq(["email@email.com"])
      mail.from.should eq(["safira.4soft@gmail.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Seu cadastro no Processo Seletivo")
    end
  end

end
