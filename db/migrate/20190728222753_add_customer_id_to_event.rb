class AddCustomerIdToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :customer_id, :uuid
  end
end
