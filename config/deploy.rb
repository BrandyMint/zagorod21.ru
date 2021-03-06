 lock '3.15.0'
set :application, 'zagorod21.ru'
set :repo_url, 'git@github.com:BrandyMint/zagorod21.ru.git'

#ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, -> { "/home/#{fetch(:user)}/#{fetch(:application)}" }

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

set :linked_files, %w(config/database.yml config/master.key)
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :nvm_type, :user # or :system, depends on your nvm setup
set :nvm_node, File.read('.nvmrc').strip
set :nvm_map_bins, %w[node yarn]

set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip

set :bundle_without, %w{development test deploy}.join(' ')
set :bundle_jobs, 10

set :nginx_server_name,  -> { "#{fetch(:application)}" }

set :assets_dir, %w(public/uploads)

after 'deploy:publishing', 'systemd:sidekiq:reload-or-restart'

namespace :deploy do
  desc "Generate sitemap"
  task :sitemapgenerate do
    on roles(:web) do
      within release_path do
        execute :rake, "sitemap:generate"
      end
    end
  end

  after :compile_assets, 'sitemapgenerate'
end
