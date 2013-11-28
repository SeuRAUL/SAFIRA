# -*- encoding : utf-8 -*-
require 'spec_helper'

new_release = '/cashiers/1/releases/new'
index = '/cashiers'

feature 'CRUD release' do
	include Features::SessionHelpers
 	
 	background do
 		
    	@user = FactoryGirl.create :enterprise
    	sign_in @user
    	@cashier = FactoryGirl.create :cashier, enterprise: @user
  	end

  context 'Index' do
    background do
      @release = FactoryGirl.create :release, cashier: @cashier
      visit '/cashiers/1/releases/new'
    end
    scenario 'creating a new release' do
      expect(page).to have_content 'Nova nota fiscal'
    end
  end

end