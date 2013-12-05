# -*- encoding : utf-8 -*-
require "spec_helper"

describe FeedbackMailer do

  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
  end

  describe "public_feedback" do
    let(:mail) { FeedbackMailer.send_public_feedback(FactoryGirl.create(:feedback)).deliver }

    it "renders the headers" do
      mail.subject.should match("Feedback da etapa")
      mail.to.should eq(["email@email.com"])
      mail.from.should eq(["safira.4soft@gmail.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Olá, candidato")
    end
  end

end
