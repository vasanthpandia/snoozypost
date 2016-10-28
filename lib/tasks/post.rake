namespace :post do
  desc "TODO"
  task facebook: :environment do
    Socialpost.where(posted_at: nil).find_each do |sp|
      if sp.app_type == 'FacebookApp'
        puts "Inside Facebook App Socialpost"
    		fbapp = Koala::Facebook::API.new(sp.installed_app.access_token)
        if sp.post.image.present?
          puts "Has image"
          fbapp.put_picture(sp.post.image.path)
        else
          puts "Has no image"
    		  fbapp.put_connections("me", "feed", :message => sp.post.content)
        end
    		sp.mark_as_posted!
    		sp.save
      end
    end
  end
end