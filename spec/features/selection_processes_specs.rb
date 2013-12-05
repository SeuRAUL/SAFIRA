# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'CRUD Selection Processes' do
  include Features::SessionHelpers

  before(:each) do
      user = create(:enterprise)
      user.confirm!
      sign_in user
  end

    scenario 'create new selection process with correct inputs' do
      visit new_selection_process_path

      within 'form' do
        fill_in 'selection_process_form_selection_process_name', with: 'Nome qualquer'
        fill_in 'selection_process_form_selection_process_call', with: 'Processo seletivo da hora'
        attach_file 'selection_process_form_selection_process_edict', Rails.root + 'spec/support/edictTest.pdf'
        fill_in 'selection_process_form_inscription_open_date', with: Time.now
        fill_in 'selection_process_form_inscription_consolidated_at', with: Time.now + 2.weeks
        click_button 'Criar Processo'
      end

      expect(page).to have_content 'Nome qualquer'
    end

    scenario 'create new selection process with incorrect inputs' do

      visit new_selection_process_path

      within 'form' do
        fill_in 'selection_process_form_selection_process_name', with: 'Nome qualquer'
        fill_in 'selection_process_form_selection_process_call', with: 'Processo seletivo da hora'
        attach_file 'selection_process_form_selection_process_edict', nil
        fill_in 'selection_process_form_inscription_open_date', with: Time.now
        fill_in 'selection_process_form_inscription_consolidated_at', with: Time.now + 2.weeks
        click_button 'Criar Processo'
      end

      expect(page).to have_content 'Para criar um processo seletivo, preencha o formulário abaixo'
    end

    scenario 'should add candidate with a valid candidate' do
      selection = create(:selection_process)
      selection.add_candidate(build(:candidate)).should be(true)

      selection.candidates.count.should be == 1
    end

    scenario 'should add candidate with a invalid candidate' do
      selection = create(:selection_process)
      selection.add_candidate(build(:candidate, curriculum: nil)).should be(false)

      selection.candidates.count.should be == 0
    end

    scenario 'should consolidate_process is called' do
      selection = create(:selection_process)
      selection.consolidate_process!

      selection.consolidated.should be == true
    end

end
