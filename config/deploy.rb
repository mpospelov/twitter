$:.unshift(File.expand_path('./lib',ENV['rvm_path']))
require 'bundler/capistrano'
require 'rvm/capistrano'
set :application, "Twitter"
set :repository,  "git@github.com:mixan946/twitter.git"
set :deploy_to, "/opt/mishaS_app"
set :user, "root"
set :use_sudo, false

set :rvm_ruby_string, '1.9.3'
set :rvm_bin_path, '/usr/local/rvm/bin'


set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "78.46.250.253"                          # Your HTTP server, Apache/etc
role :app, "78.46.250.253"                          # This may be the same as your `Web` server
role :db,  "78.46.250.253", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
