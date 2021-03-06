lock "3.8.2"

set :application, "qedu-hub"
set :repo_url, "https://github.com/QEdu/qedu-hub.git"

ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :format_options, log_file: "var/logs/capistrano.log"

set :local_user, -> { `git config user.name`.chomp }
set :use_sudo, true

after 'deploy:updated', 'phpfpm:restart'
