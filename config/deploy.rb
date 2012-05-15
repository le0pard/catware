require "capistrano/ext/multistage"
require "bundler/capistrano"
require "rvm/capistrano"
require File.expand_path('../../lib/capistrano_recipes/tasks/capistrano_database_yml.rb', __FILE__)
require File.expand_path('../../lib/capistrano_recipes/tasks/unicorn.rb', __FILE__)
#require File.expand_path('../../lib/capistrano_recipes/tasks/thin.rb', __FILE__)
#Dir['lib/capistrano_recipes/tasks/*.rb'].each { |task| require task }

load 'deploy/assets'

set :stages, %w(production)
set :default_stage, "production"

set :scm, :git
set :scm_verbose, false
set :repository,  "git://github.com/le0pard/catware.git"

set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :keep_releases, 3

set :rvm_ruby_string, 'ruby-1.9.3-rc1@catware_gems'
set :rvm_type, :user

#task :assets_precompile, :roles => :app, :except => { :no_release => true } do
#  run "cd #{release_path}; bundle exec rake assets:precompile RAILS_ENV=#{rails_env}"
#end

deploy.task :clean_cache, :roles => :app, :except => { :no_release => true }, :on_error => :continue do
  run "rm -fr #{current_path}/public/cache/*", :once => true
end

namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
   
   namespace :web do
    task :disable, :roles => :web do
      # invoke with  
      # UNTIL="16:00 MST" REASON="a database upgrade" cap deploy:web:disable

      on_rollback { rm "#{shared_path}/system/maintenance.html" }

      require 'erb'
      deadline, reason = ENV['UNTIL'], ENV['REASON']
      maintenance = ERB.new(File.read("./app/views/layouts/maintenance.erb")).result(binding)

      put maintenance, "#{shared_path}/system/maintenance.html", :mode => 0644
    end
  end
end
