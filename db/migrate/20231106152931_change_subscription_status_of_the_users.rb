class ChangeSubscriptionStatusOfTheUsers < ActiveRecord::Migration[7.0]
  def up
    change_table :users do |t|
      t.change :subscription_status, :string, default: "active"
      t.change :plan, :string, default: "free"
    end
  end

  def down
    change_table :users do |t|
      t.change :subscription_status, :string, default: "incomplete"
      t.change :plan, :string
    end
  end
end
