## Getting Started

Скачиваем проект и переходим в его директорию

    $ git clone git@github.com:BrandyMint/zagorod.git 
    $ cd zagorod
    
Устанавливаем gems

    $ bundle install
    
Устанавливаем компоненты для front-end с использованием http://bower.io
    
    $ bower install
    
Копируем файл с настройками базы данных и настраиваем под свою систему
    
    $ cp config/database.yml.example config/database.yml
    
Создаем базу данных и запускаем миграцию
    
    $ bin/rake db:create && bin/rake db:migrate
    
Загружаем данные по умолчанию

    $ bin/rake db:seed
    
Запускаем проект
    
    $ bin/rails server

### База данных / Файлы

`cap production zagorod:pull` - скачать базу и uploads

`cap production zagorod:pull_uploads` - скачать uploads

### Ссылочки
Яндекс метрика- 

