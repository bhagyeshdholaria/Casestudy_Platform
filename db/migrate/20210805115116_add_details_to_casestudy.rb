class AddDetailsToCasestudy < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.text :body, null: false
      t.references :casestudy, null: false, index: true, foreign_key: true

    end

    create_table :questions do |t|
      t.text :body, null: false
      t.references :casestudy, null: false, index: true, foreign_key: true

    end
  end
end
