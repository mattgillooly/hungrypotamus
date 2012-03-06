class CreateChatEvents < ActiveRecord::Migration
  def change
    create_table :chat_events do |t|
      t.string :actor
      t.string :message

      t.timestamps
    end

    add_index :chat_events, :created_at
  end
end
