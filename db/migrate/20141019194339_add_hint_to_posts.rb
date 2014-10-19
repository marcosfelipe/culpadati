class AddHintToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :hint, :boolean, :default => 0
  end
end
