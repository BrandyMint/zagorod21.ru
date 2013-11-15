set :stage, :staging
set :application, 'stage.example.com'
server 'stage.example.com', user: 'www', roles: %w{web app db}
set :ssh_options, {
    forward_agent: true,
    port: 222
}
set :rails_env, :staging
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
fetch(:default_env).merge!(rails_env: :staging)
