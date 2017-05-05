require 'data_mapper'
require './app/app.rb'

task :default do
  puts "Rake is up and running"
end

desc 'datamapper tasks' do
  namespace :db do

    desc 'database auto_migrate' do
      task :auto_migrate do
        DataMapper.auto_migrate!
      end

    desc 'database auto_upgrade' do
      task :auto_upgrade do
        DataMapper.auto_upgrade!
      end
  end
