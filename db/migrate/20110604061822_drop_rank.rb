class DropRank < ActiveRecord::Migration
  def self.up
    remove_column :restaurants, :rank, :integer
  end

  def self.down
    add_column :restaurants, :rank, :integer
  end
end
