## Getting Started

- git clone git@github.com:BrandyMint/zagorod.git && cd zagorod
- rvm use 2.1.1@zsgorod --ruby-version --create (if used rvm)
- cp config/database.yml.example config/database.yml
- bower install (http://bower.io/)
- rake db:create
- rake db:migrate
- rale db:seed
- rails s

### DB/Uploads

`cap production zagorod:pull` - скачать базу и uploads

`cap production zagorod:pull_uploads` - скачать uploads

### Ссылочки
Яндекс метрика- 
