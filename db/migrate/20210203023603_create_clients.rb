class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :gender, null: false
      t.integer :age, null: false
      t.text :address, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
