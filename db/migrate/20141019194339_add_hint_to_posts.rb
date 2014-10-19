class AddHintToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :hint, :boolean, :default => 'f'
  end
end
