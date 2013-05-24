# set :application, "set your application name here"
# set :repository,  "set your repository location here"

# # set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# # Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# # if you want to clean up old releases on each deploy uncomment this:
# # after "deploy:restart", "deploy:cleanup"

# # if you're still using the script/reaper helper you will need
# # these http://github.com/rails/irs_process_scripts

# # If you are using Passenger mod_rails uncomment this:
# # namespace :deploy do
# #   task :start do ; end
# #   task :stop do ; end
# #   task :restart, :roles => :app, :except => { :no_release => true } do
# #     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
# #   end
# # end

require "bundler/capistrano"
require "rvm/capistrano"
load 'deploy/assets'
ssh_options[:port] = 2222


set :application,   "mdkradomsko"
set :domain,        "lucjansuski.pl:2222"
set :repository,    "ssh://git@lucjansuski.pl:2222/mdkradomsko.git"
set :use_sudo,      false
set :deploy_to,     "/home/deployer/apps/#{application}"
set :scm,           "git"
set :user,          "deployer"

role :app, domain
role :web, domain
role :db, domain, :primary => true

# Add RVM's lib directory to the load path.
set :rvm_ruby_string, 'ruby-1.9.3-p392'
set :rvm_type, :system

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

end