#namespace :db do
#  desc "Fill database with sample data"
#  task :populate => :environment do
#    Rake::Task['db:reset'].invoke
#    make_thot_workers
#  end
#end
#
#def make_thot_workers
#  User.create!(:name => "Vinay")
#  User.create!(:name => "Ash")
#  User.create!(:name => "Piyush")
#
#end
