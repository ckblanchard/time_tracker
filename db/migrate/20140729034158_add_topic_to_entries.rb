class AddTopicToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :topic, :string
  end
end
