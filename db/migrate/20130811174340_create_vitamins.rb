class CreateVitamins < ActiveRecord::Migration
  def change
    create_table :vitamins do |t|
      t.boolean :consumed

      t.timestamps
    end
  end
end
