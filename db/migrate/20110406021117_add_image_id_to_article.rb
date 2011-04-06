class AddImageIdToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :image_id, :integer
  end

  def self.down
    remove_column :articles, :image_id
  end
end
