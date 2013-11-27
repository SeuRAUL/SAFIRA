# -*- encoding : utf-8 -*-
require 'spec_helper'

new_release = '/cashiers/1/releases/new'
index = '/cashiers'

feature 'CRUD release' do

	scenario 'create Release when everything is already registered and with valid data' do
		@current_user = create(:enterprise)
		
		#create(:cashier)	

		visit new_release

		fill_in 'release[value]', with: 19.50
		fill_in 'release[doc_number]', with: 666
		fill_in 'release[date_release]', with: '2013-10-31'
		fill_in 'release[description]', with: 'McDonalds'
		#fill_in 'release[form_payment]', with: 'Cartao'
		#fill_in 'release[doc_type]', with: 'Recibo'
		#fill_in 'release[type_release]', with: 'Saida'
		fill_in 'release[origin_destination]', with: 'Origem'

		click_button("Cadastrar")

		page.should have_content('Release was successfully created.')

	end	
end