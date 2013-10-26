# -*- encoding : utf-8 -*-
require 'spec_helper'

new_release = '/cashiers/:cashier_id/releases/new'
index = '/cashiers'

feature 'CRUD release' do

	scenario 'create Release when everything is already registered and with valid data' do
		create(:cashier)	

		visit new_release

		fill_in 'release[value]', with: 19.50
		fill_in 'release[doc_number]', with: 666
		fill_in 'release[date_release]', with: Date.now
		fill_in 'release[description]', with: 'McDonalds'
		fill_in 'release[form_payment]', with: 'Cartao'
		fill_in 'release[doc_type]', with: 'Example 1'

	end	
end