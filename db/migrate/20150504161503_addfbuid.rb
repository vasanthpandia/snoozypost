class Addfbuid < ActiveRecord::Migration
  def change
    add_column :installed_apps, :uid, :string
  end
end
