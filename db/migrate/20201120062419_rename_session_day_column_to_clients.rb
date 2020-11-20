class RenameSessionDayColumnToClients < ActiveRecord::Migration[6.0]
  def change
    rename_column :clients, :session_day, :start_time
  end
end
