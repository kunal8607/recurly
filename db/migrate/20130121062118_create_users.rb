class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :account_code
      t.string :email
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
