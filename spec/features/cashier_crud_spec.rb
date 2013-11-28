# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'Cashier Features' do
  include Features::SessionHelpers

  background do
    @user = FactoryGirl.create :enterprise
    sign_in @user
  end

  context 'Create' do
    
    background do
      @cashier = FactoryGirl.create :cashier, enterprise: @user
    end

    scenario 'after create cashier' do
      expect @cashier.opening_balance == 0
    end

    # context 'with correct inputs' do
    #   background do
    #     fill_in 'project[title]', with: 'Project title'
    #     fill_in 'project[description]', with: 'Project description'
    #     click_on 'Save'
    #   end
    #   scenario 'it displays the project' do
    #     expect(page).to have_content 'Project title'
    #   end
    #   scenario 'it displays the owner of the project' do
    #     expect(page).to have_content @user.email
    #   end
      
    # end

    # scenario 'with incorrect inputs' do
    #   click_on 'Save'
    # end

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