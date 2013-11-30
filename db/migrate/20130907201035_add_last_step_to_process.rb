# -*- encoding : utf-8 -*-
class AddLastStepToProcess < ActiveRecord::Migration
  def change
  	add_column :selection_processes, :last_step_consolidated, :datetime
  end
end
