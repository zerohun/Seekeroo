class AddTagboxIdInSubtitle < ActiveRecord::Migration
  def self.up
    add_column :subtitles, :tagbox_id, :integer
  end

  def self.down
    remove_column :subtitles, :tagbox_id
  end
end
