lock '3.11.0'
set :application, 'zagorod21.ru'
set :repo_url, 'git@github.com:BrandyMint/zagorod21.ru.git'

#ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, -> { "/home/#{fetch(:user)}/#{fetch(:application)}" }

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip

set :bundle_without, %w{development test deploy}.join(' ')
set :bundle_jobs, 10

namespace :deploy do
  desc "Generate sitemap"
  task :sitemapgenerate do
    on roles(:web) do
      within release_path do
        execute :rake, "sitemap:generate"
      end
    end
  end

  before :compile_assets, 'sitemapgenerate'
end
