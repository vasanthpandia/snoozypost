class AddPostedAtToSocialPosts < ActiveRecord::Migration
  def change
    add_column :socialposts, :posted_at, :datetime
  end
end
