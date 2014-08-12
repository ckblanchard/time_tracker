class AddTopicIdToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :topic_id, :integer
  end
end
