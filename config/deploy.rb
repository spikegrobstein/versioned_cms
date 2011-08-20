set :application, "sadistech_admin"
set :repository,  "git@github.com:spikegrobstein/sadistech_admin.git"

set :deploy_to, "/home/sadistech/admin"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "sadistech.com"                          # Your HTTP server, Apache/etc
role :app, "sadistech.com"                          # This may be the same as your `Web` server
role :db,  "sadistech.com", :primary => true # This is where Rails migrations will run

set :use_sudo, false

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  
  task :symlink_database_yml do
    run "#{try_sudo} ln -s #{shared_path}/database.yml #{current_path}/config/database.yml"
  end
end