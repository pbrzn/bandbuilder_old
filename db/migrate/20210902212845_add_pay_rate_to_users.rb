class AddPayRateToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :pay_rate, :float
  end
end
