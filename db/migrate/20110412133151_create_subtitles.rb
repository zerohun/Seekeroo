class CreateSubtitles < ActiveRecord::Migration
  def self.up
    create_table :subtitles do |t|
      t.string :text
      t.integer :article_id

      t.timestamps
    end
  end

  def self.down
    drop_table :subtitles
  end
end
