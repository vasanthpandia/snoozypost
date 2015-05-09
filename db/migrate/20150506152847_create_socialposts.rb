class CreateSocialposts < ActiveRecord::Migration
  def change
    create_table :socialposts do |t|
      t.belongs_to :post
      t.belongs_to :installed_app
      t.timestamps null: false
    end
  end
end