class ChangeMoneyColumnToAccountToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :money, :account
  end
end
