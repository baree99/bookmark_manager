require 'data_mapper'
require './app/app.rb'

task :default do
  puts "Rake is up and running"
end

desc 'datamapper tasks'
  namespace :db do

    desc 'database auto_migrate'
      task :auto_migrate do
        DataMapper.auto_migrate!
      end

    desc 'database auto_upgrade'
      task :auto_upgrade do
        DataMapper.auto_upgrade!
      end
  end
