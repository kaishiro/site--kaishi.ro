class CreateInputs < ActiveRecord::Migration
  def change
    create_table :inputs do |t|
      t.string :body

      t.timestamps
    end
  end
end
