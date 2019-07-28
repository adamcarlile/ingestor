class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events, id: :uuid do |t|
      t.string :name
      t.jsonb :payload, default: {}
      t.jsonb :metadata, default: {}
      t.datetime :client_created_at
      t.timestamps
    end
  end
end
