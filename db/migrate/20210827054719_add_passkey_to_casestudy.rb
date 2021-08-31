class AddPasskeyToCasestudy < ActiveRecord::Migration[6.1]
  def change
    add_column :casestudies, :passkey, :string
    add_index :casestudy_users, [:casestudy_id, :user_id], unique: true
  end
end
