# -*- encoding : utf-8 -*-
class AddViewToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :view, :boolean, default: true
  end
end
