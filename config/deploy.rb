lock "~> 3.20"

set :application, "cdp_aws_deploy"
set :repo_url, "https://Owens345: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@github.com/Owens345/aws-deploy-bog.git"
set :branch,      :master

set :deploy_to,   "/var/www/cdp_aws_deploy"

set :linked_files, %w[config/master.key .env]
set :linked_dirs,  %w[
  log
  tmp/pids
  tmp/cache
  tmp/sockets
  vendor/bundle
  public/system
  storage
]

set :rbenv_ruby, "3.3.0"
set :rbenv_path, "/home/ubuntu/.rbenv"

set :keep_releases, 5

set :unicorn_config_path, -> {
  File.join(current_path, "config", "unicorn.rb")
}

after "deploy:publishing", "deploy:restart"
namespace :deploy do
  task :restart do
    invoke "unicorn:restart"
  end
end