class AddStateToImages < ActiveRecord::Migration
  def self.up
    add_column :images, :state, :string
  end

  def self.down
    remove_column :images, :state
  end
end
