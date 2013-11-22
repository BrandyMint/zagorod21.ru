set :stage, :production
server 'icfdev.ru', user: 'wwwzagorod21', port: 229, roles: %w{web app db}
set :rails_env, :production
set :branch, ENV['BRANCH'] || 'master'
fetch(:default_env).merge!(rails_env: :production)
