class ChangeTelephoneTypeInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :telephone, :string
  end
end
