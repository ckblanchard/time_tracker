class RemoveTopicFromEntries < ActiveRecord::Migration
  def change
    remove_column :entries, :topic
  end
end
