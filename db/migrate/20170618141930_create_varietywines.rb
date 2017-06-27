class CreateVarietywines < ActiveRecord::Migration
  def change
    create_table :varietywines do |t|
      t.string :name, null: false
      t.string :type_of_wine, null: false
      t.string :color, null: false
      t.integer :aging_in_barrels, null: false
      t.integer :aging_in_bottles, null: false

      t.timestamps null: false
    end
  end
  def up
    execute("ALTER TABLE winesorts ADD CONSTRAINT type_of_wine_check CHECK(type_of_wine IN('Сухое',
    'Полусухое','Полусладкое',
    'Сладкое','Ликёрное', 'Другое'))")
  end
end
