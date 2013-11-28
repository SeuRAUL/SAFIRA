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
  	end

  context 'Index' do
    scenario 'creating a new release' do
      expect(page).to have_content 'Nova nota fiscal'
    end
  end

  context 'Create' do
	scenario 'with correct inputs - create' do
		click_on 'Cadastrar'
	   	expect(page).to have_content 19.50
	   	expect(page).to have_content 666
	   	expect(page).to have_content '2013-10-31'
	   	expect(page).to have_content 'McDonalds'
	   	expect(page).to have_content 'Dinheiro'
	   	expect(page).to have_content 'Recibo'
	   	expect(page).to have_content 'Saida'
	   	expect(page).to have_content 'Origem'
	end
  end

  context 'Update' do
    scenario 'with correct inputs - update' do
    	click_on 'Cadastrar'
      	click_on 'EDITAR'
    	fill_in 'release[description]', with: 'Subway'
    	click_on 'Cadastrar'
    	expect(page).to have_content 'Subway'
    end
  end

  context 'Destroy' do
    scenario 'successfully' do
      click_on 'Cadastrar'
      click_on 'EXCLUIR'
    end
  end

end