class AddSubscriptionFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :plan, :string
    add_column :users, :subscription_status, :string, default: "incomplete"
    add_column :users, :stripe_customer_id, :string
  end
end
