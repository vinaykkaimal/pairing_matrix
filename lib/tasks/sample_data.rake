namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_thot_workers
    make_relationships
  end
end

def make_thot_workers
  ThotWorker.create("Vinay")
  ThotWorker.create("Ash")
  ThotWorker.create("Piyush")

end

def make_relationships

end