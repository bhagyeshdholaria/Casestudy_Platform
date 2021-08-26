class CreateCasestudies < ActiveRecord::Migration[6.1]
  def change
    create_table :casestudies do |t|
      t.integer :duration, null: false
      t.integer :scale, null: false

      t.timestamps
    end
  end
end
