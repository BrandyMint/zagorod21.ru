set :stage, :production
server 'example.com', user: 'www', roles: %w{web app db}
set :ssh_options, {
    forward_agent: true,
    port: 222
}
set :rails_env, :production
fetch(:default_env).merge!(rails_env: :production)
