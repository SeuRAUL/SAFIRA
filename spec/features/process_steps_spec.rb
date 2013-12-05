# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'CRUD Selection Processes' do
  include Features::SessionHelpers

  before(:each) do
      user = create(:enterprise)
      user.confirm!
      sign_in user
  end

    scenario 'show process step' do
      selection_process = create(:selection_process)
      visit '/selection_processes/1-processname-4soft'
      # find('a.btn--success').click
      process_step = create(:process_step)
      visit '/selection_processes/1-processname-4soft/process_steps/1'
    end

    scenario 'edit process step' do
      selection_process = create(:selection_process)
      visit '/selection_processes/1-processname-4soft'
      process_step = create(:process_step)
      visit '/selection_processes/1-processname-4soft/process_steps/1'
      find('.btn--primary').click
      # click_on 'ADICIONAR ETAPA'
      expect(page).to have_content 'Editar'
    end

    scenario 'consolidate process step' do
      selection_process = create(:selection_process)
      visit '/selection_processes/1-processname-4soft'
      process_step = create(:process_step)
      visit '/selection_processes/1-processname-4soft/process_steps/1'
      find('.btn').click
      expect(page).to have_content 'Listagem de Etapas'
    end
end
