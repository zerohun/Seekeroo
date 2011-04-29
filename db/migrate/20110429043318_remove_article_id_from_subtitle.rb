class RemoveArticleIdFromSubtitle < ActiveRecord::Migration
  def self.up

    remove_column :subtitles, :article_id
  end

  def self.down
    add_column :subtitles, :article_id, :integer
  end
end
