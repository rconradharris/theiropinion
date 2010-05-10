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

