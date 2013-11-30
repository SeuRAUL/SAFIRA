# -*- encoding : utf-8 -*-
require 'spec_helper'

new_release = '/cashiers/1/releases/new'

index = '/cashiers'

feature 'Release Features' do
	include Features::SessionHelpers
 	
 	background do
    	@user = FactoryGirl.create :enterprise
    	sign_in @user
    	@cashier = FactoryGirl.create :cashier, enterprise: @user
  	end

  context 'Index' do
    background do
      @release = FactoryGirl.create :release, cashier: @cashier
      visit new_release
    end
    scenario 'creating a new release' do
      expect(page).to have_content 'Nova nota fiscal'
    end
  end

  context 'Create' do
    background do
      @release = FactoryGirl.create :release, cashier: @cashier
      visit new_release
      fill_in 'release[value]', with: 19.50
      fill_in 'release[doc_number]', with: 666
      fill_in 'release[date_release]', with: '2013-10-31'
      fill_in 'release[description]', with: 'McDonalds'
      select 'Dinheiro', from: 'release[form_payment]'
      select 'Recibo', from: 'release[doc_type]'
      select 'Saida', from: 'release[type_release]'
      fill_in 'release[origin_destination]', with: 'Origem'
      click_on 'Cadastrar'
    end
  	scenario 'with correct inputs - create' do
  	    # expect(page).to have_content 'Últimos lançamentos'
  	end
  end

  context 'Update' do
    background do
      @release = FactoryGirl.create :release, cashier: @cashier
      visit edit_cashier_release_path(@cashier.id, @release)
    end
    scenario 'with correct inputs - update' do
    	fill_in 'release[description]', with: 'Subway'
    	# click_on 'Cadastrar'
    	# expect(page).to have_content 'Subway'
    end
  end

  context 'Destroy' do
    background do
      @release = FactoryGirl.create :release, cashier: @cashier
      # visit '/cashiers/1/'
    end
    scenario 'successfully' do
      # click_link 'EXCLUIR'
    end
  end

end