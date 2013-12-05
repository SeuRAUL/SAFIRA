# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'Cashier Features' do
  include Features::SessionHelpers

  background do
    user = create(:enterprise)
    user.confirm!
    sign_in user
  end

  context 'Create' do
    
    background do
      @cashier = FactoryGirl.create :cashier
      @enterprise = FactoryGirl.create :enterprise, cashier: @cashier
    end

    scenario 'after create cashier' do
      expect @cashier.opening_balance == 0
    end

    scenario 'try create a cashier manually' do
      visit '/cashiers/new'
      fill_in 'cashier[opening_balance]', with: 200
      click_on 'Create Cashier'
    end

    scenario 'try create a cashier manually inducing an error' do
      visit '/cashiers/new'
      fill_in 'cashier[opening_balance]', with: nil
      click_on 'Create Cashier'
    end

  end

  # context 'Update' do

  #   background do
  #     @cashier = FactoryGirl.create :cashier, enterprise: @user
  #     visit "projects/#{@project.id}/edit"
  #   end

  #   scenario 'editing cashier' do
  #     @cashier = FactoryGirl.create :cashier, enterprise: @user
  #   end

  #   scenario 'with incorrect inputs' do
  #     fill_in 'project[title]', with: ''
  #     click_on 'Save'
  #   end
  # end

  # context 'Destroy' do
    
  #   background do
  #     @project = FactoryGirl.create :project, owners: [@user]
  #     visit "projects/#{@project.id}"
  #   end

  #   scenario 'successfully' do
  #     click_on 'Delete'
  #     # page.driver.browser.switch_to.alert.accept
  #   end
  # end

end
