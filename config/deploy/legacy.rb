set :stage, :production
set :rails_env, :production
set :rbenv_ruby, '2.1.2'
set :user, 'wwwzagorod21'
set :branch, ENV['BRANCH'] || 'master'
fetch(:default_env).merge!(rails_env: :production)
server 'zagorod21.ru', user: fetch(:user), port: '229', roles: %w{web app db}
