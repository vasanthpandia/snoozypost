class CreateInstalledApps < ActiveRecord::Migration
  def change
    create_table :installed_apps do |t|
    	t.belongs_to :user
    	t.string :provider
    	t.string :access_token
     	t.timestamps null: false
    end
  end
end
