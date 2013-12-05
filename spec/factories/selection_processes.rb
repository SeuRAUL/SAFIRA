# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :selection_process do

    call "selection_process call"
    name "selection_process name"
    edict File.new(Rails.root + 'spec/support/edictTest.pdf')
    edict_file_name 'edictTest'
	edict_content_type 'text'
	edict_file_size 13
	edict_updated_at Date.today
    consolidated_at Date.today
    consolidated false
    enterprise { FactoryGirl.build(:enterprise) }
    created_at Date.today
    updated_at Date.today
    enterprise_id 1
    last_step_consolidated false
  end
end
