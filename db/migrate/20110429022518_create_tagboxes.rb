class CreateTagboxes < ActiveRecord::Migration
  def self.up
    create_table :tagboxes do |t|
      t.integer :left
      t.integer :top
      t.integer :width
      t.integer :height
      t.integer :article_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tagboxes
  end
end
