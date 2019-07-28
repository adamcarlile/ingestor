class CreateConversions < ActiveRecord::Migration[5.2]
  def change
    create_table :conversions, id: :uuid do |t|
      t.references :customer, type: :uuid
      t.references :event, type: :uuid
      t.string :kind
      t.integer :value_cents, default: 0
      t.timestamps
    end
  end
end
