namespace :post do
  desc "TODO"
  task facebook: :environment do
    fbapp = Koala::Facebook::API.new(User.first.installed_apps.first.access_token)
    puts fbapp.get_object('me')
  end
end
