class CreateGrapesorts < ActiveRecord::Migration
  def change
    create_table :grapesorts do |t|
      t.string :name, null: false
      t.string :place_of_production, null: false
      t.date :date_of_collection, null: false

      t.timestamps null: false
    end
  end
end
