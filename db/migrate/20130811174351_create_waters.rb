class CreateWaters < ActiveRecord::Migration
  def change
    create_table :waters do |t|
      t.boolean :consumed

      t.timestamps
    end
  end
end
