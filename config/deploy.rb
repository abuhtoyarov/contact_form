# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'contact_form'
set :repo_url, 'git@github.com:abuhtoyarov/contact_form.git'

set :deploy_to, "/home/deployer/contact_form"
set :deploy_user, 'deployer'

set :linked_files, fetch(:linked_files, []).push('config/database.yml', '.env')

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :sidekiq_options_per_process, ["--queue default --queue mailers"]

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'unicorn:restart'
    end
  end
  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'unicorn:stop'
    end
  end
  after :publishing, :restart  
end
