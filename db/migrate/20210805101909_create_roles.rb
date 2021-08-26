class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :name, unique: true
      t.timestamps
    end

    create_table :role_users do |t|
      t.references :role, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
