# -*- encoding : utf-8 -*-
class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :type_release
      t.decimal :value
      t.text :description
      t.string :form_payment
      t.date :date_release
      t.integer :doc_number
      t.string :doc_type
      t.string :origin_destination
      t.references :cashier

      t.timestamps
    end
  end
end
