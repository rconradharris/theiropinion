set :application, "theiropinion"
set :repository,  "git@github.com:rconradharris/theiropinion.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :user, "deploy"

server "exmachina.rconradharris.com", :app, :web, :db, :primary => true

namespace :deploy do
  %w(start stop restart).each do |action|
     desc "#{action} the Thin processes"
     task action.to_sym do
       find_and_execute_task("thin:#{action}")
    end
  end
end
namespace :thin do
  %w(start stop restart).each do |action|
  desc "#{action} the app's Thin Cluster"
    task action.to_sym, :roles => :app do
      run "thin #{action} -c #{deploy_to}/current -C #{deploy_to}/current/config/thin.yml"
    end
  end
end
