lock '3.2.1'
set :application, 'zagorod21.ru'
set :repo_url, 'git@github.com:BrandyMint/zagorod.git'

#ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, ->{"/home/wwwzagorod21/#{fetch(:application)}"}
set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :rbenv_type, :user
set :rbenv_ruby, '2.1.2'

set :bundle_without, %w{development test deploy}.join(' ')
set :bundle_jobs, 10

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:web), in: :sequence, wait: 5 do
      execute "/etc/init.d/unicorn-#{fetch(:application)} upgrade"
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc 'Notify airbrake'
  task :notify do
    on roles(:all) do
      within release_path do
        execute :rake, 'airbrake:deploy', "TO=#{fetch(:rails_env)}",
          "REVISION=\"`head -n1 #{repo_path}/FETCH_HEAD | cut -f1`\"",
          "REPO=#{fetch(:repo_url)}",
          "USER=#{ENV['USER'] || ENV['USERNAME']}"
      end
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  desc "Deploy bower"
  task :bowerinstall do
    on roles(:web) do
      within release_path do
        execute :bower, 'install'
      end
    end
  end

  desc "Generate sitemap"
  task :sitemapgenerate do
    on roles(:web) do
      within release_path do
        execute :rake, "sitemap:generate"
      end
    end
  end

  before :compile_assets, 'bowerinstall'
  before :compile_assets, 'sitemapgenerate'
  after :publishing, :restart
  after :finishing, 'deploy:cleanup'
  after :finishing, 'deploy:notify'

end
