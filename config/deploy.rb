require "capistrano/ext/multistage"
require "bundler/capistrano"
require File.expand_path('../../lib/capistrano_recipes/tasks/capistrano_database_yml.rb', __FILE__)
#Dir['lib/capistrano_recipes/tasks/*.rb'].each { |task| require task }

set :stages, %w(production)
set :default_stage, "production"

set :scm, :git
set :scm_verbose, false
set :repository,  "git://github.com/le0pard/catware.git"

set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :keep_releases, 3

#namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
#end