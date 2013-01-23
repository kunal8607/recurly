class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :account
      t.string :plan

      t.timestamps
    end
  end
end
