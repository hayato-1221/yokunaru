class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    add_reference :logs, :client, index: true
    create_table :logs do |t|
      t.date :date
      t.integer :fee

      t.timestamps
    end
  end
end
