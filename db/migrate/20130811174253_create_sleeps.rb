class CreateSleeps < ActiveRecord::Migration
  def change
    create_table :sleeps do |t|
      t.boolean :action

      t.timestamps
    end
  end
end
