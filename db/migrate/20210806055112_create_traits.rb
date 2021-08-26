class CreateTraits < ActiveRecord::Migration[6.1]
  def change
    create_table :traits do |t|
      t.string :name, null: false, unique: true
    end

    create_table :question_traits do |t|
      t.references :trait
      t.references :question

      t.timestamps
    end

    create_table :assessor_responses do |t|
      t.references :question_trait, index: true, null: false, foreign_key: true
      t.references :casestudy_user, index: true, null: false, foreign_key: true
      t.references :user, index: true, null: false, foreign_key: true
      t.references :assessor, index: true, null: false, foreign_key: { to_table: :users }
      t.float :rating

      t.timestamps
    end
  end
end
