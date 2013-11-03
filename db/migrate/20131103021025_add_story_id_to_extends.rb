class AddStoryIdToExtends < ActiveRecord::Migration
  def change
    add_column :extends, :story_id, :integer
    add_index :extends, :story_id
  end
end
