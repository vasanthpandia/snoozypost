class CreateSocialposts < ActiveRecord::Migration
  def change
    create_table :socialposts do |t|
      t.references :post
      t.references :installed_app
      t.timestamps null: false
    end
  end
end