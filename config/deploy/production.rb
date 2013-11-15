set :stage, :production
server 'icfdev.ru', user: 'wwwzagorod21', roles: %w{web app db}
set :ssh_options, {
    forward_agent: true,
    port: 229
}
set :rails_env, :production
set :branch, ENV['BRANCH'] || 'master'
fetch(:default_env).merge!(rails_env: :production)
