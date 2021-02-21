class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.text :subjective
      t.text :objective
      t.text :assessment
      t.text :plan
      t.text :memo
      t.belongs_to :log, index: true, foreign_key: true

      t.timestamps
    end
  end
end
