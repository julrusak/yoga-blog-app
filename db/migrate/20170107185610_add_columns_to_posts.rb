class AddColumnsToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :intro, :text 
  	add_column :posts, :conclusion, :text 
  	add_column :posts, :subtitle, :text 
  end
end
