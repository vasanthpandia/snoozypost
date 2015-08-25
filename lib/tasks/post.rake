namespace :post do
  desc "TODO"
  task facebook: :environment do
    # File.open("postlog", 'a') {|f| f.write("#{Time.now} \n") }
    Socialpost.where(posted_at: nil).find_each(batch_size: 50) do |sp|
		fbapp = Koala::Facebook::API.new(sp.installed_app.access_token)
		fbapp.put_connections("me", "feed", :message => sp.post.content)
		sp.mark_as_posted!
		sp.save
    end
  end
end