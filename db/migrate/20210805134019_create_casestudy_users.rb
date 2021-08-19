class CreateCasestudyUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :casestudy_users do |t|
      t.references :casestudy, index: true, null: false, foreign_key: true
      t.references :user, index: true, null: false, foreign_key: true
      t.references :assessor, index: true, null: false, foreign_key: { to_table: :users }

      t.string :status, default: 'pending'
      t.integer :time_elapsed, default: 0
      t.datetime :started_time
      t.datetime :completed_time

      t.timestamps
    end

    create_table :user_responses do |t|
      t.references :question, index: true, null: false, foreign_key: true
      t.references :casestudy_user, index: true, null: false, foreign_key: true
      t.references :user, index: true, null: false, foreign_key: true

      t.text :response

      t.timestamps
    end
  end
end
