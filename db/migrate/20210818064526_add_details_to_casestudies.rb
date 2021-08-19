class AddDetailsToCasestudies < ActiveRecord::Migration[6.1]
  def change
    add_column :casestudies, :name, :string
    add_reference :casestudies, :creator, index: true, null: false, foreign_key: {to_table: :users}
  end
end
