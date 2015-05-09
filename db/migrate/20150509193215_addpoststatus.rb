class Addpoststatus < ActiveRecord::Migration
  def change
  	add_column :socialposts, :status, :boolean, :default => false
  end
end
