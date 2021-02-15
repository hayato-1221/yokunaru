class AddColumnLogs < ActiveRecord::Migration[6.1]
  def change
    add_reference :logs, :client, index: true
  end
end
