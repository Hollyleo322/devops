## Part 1. Готовый докер
#### Качаем образ nginx
![compdocker1](screens/Screenshot_1.png)
#### Проверяем наличие образа
![compdocker2](screens/Screenshot_2.png)
#### Запускаем docker образ
![compdocker3](screens/Screenshot_3.png)
#### Проверяем запуск
![compdocker4](screens/Screenshot_4.png)
#### Размер контейнера
![compdocker5](screens/Screenshot_5.png)
#### Список замапленных портов
![compdocker6](screens/Screenshot_6.png)
#### Ip адрес
![compdocker7](screens/Screenshot_7.png)
#### Останавливаем контейнер и проверяем что он остановлен
![compdocker8](screens/Screenshot_8.png)
#### Запускаем докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине
![compdocker9](screens/Screenshot_9.png)
#### Видим стартовую страницу nginx по адресу localhost:80
![compdocker10](screens/Screenshot_10.png)
#### Перезапускаем контейнер и видим что он в работе
![compdocker11](screens/Screenshot_11.png)
## Part 2. Операции с контейнером
#### Читаем файл nginx.conf в контейнере
![operations1](screens/Screenshot_12.png)
#### Создаём файл nginx.conf на локальной машине, вставляем, то что скопировали с файла в контейнере, изменяем его
![operation2](screens/Screenshot_13.png)
#### Здесь мы комментируем include и добавляем блок server с блоком location
![operation6](screens/Screenshot_16.png) 
#### Копируем созданный на локальной машине файл nginx.conf в контейнер
![operation3](screens/Screenshot_14.png)
#### Перезапускаем настройки nginx 
![operation5](screens/Screenshot_17.png)
#### Как видим, добавились нужные нам строчки
![operation4](screens/Screenshot_15.png)
#### Проверяем страницу по адресу localhost/status
![operation7](screens/Screenshot_18.png)
#### Экспортируем контейнер в файл container.tar
![operation8](screens/Screenshot_19.png)
#### Он появился в директории, в которой на данный момент мы находимся
![operation9](screens/Screenshot_20.png)
#### Останавливаем контейнер
![operation10](screens/Screenshot_21.png)
#### Удаляем образ используя опцию -f
![operation11](screens/Screenshot_22.png)
#### Удаляем контейнер
![operation12](screens/Screenshot_23.png)
#### Импортируем контейнер
![operation13](screens/Screenshot_24.png)
#### Как видим на скрине, команда docker import создаёт image из архива tar
![operation14](screens/Screenshot_25.png)
#### Создаём и запускаем контейнер с полученного образа
![operation15](screens/Screenshot_26.png)
#### Запускаем внутри контейнера nginx
![operation16](screens/Screenshot_27.png)
#### Видим что по адресу localhost/status получаем страницу со статусом nginx
![operation17](screens/Screenshot_28.png)

## Part 3. Мини веб-сервер
#### Пишем мини сервер fcgi
![server1](screens/Screenshot_29.png)
#### Устанавливаем библиотеку fcgi,  утилиту spawn-fcgi, и nginx `apt-get install libfcgi-dev` и `apt-get install spawn-fcgi` `apt-get install nginx`
#### Компилируем `fcgi.c`
#### Запускаем сервер командой `spawn-fcgi -p 8080 fcgi`
#### Создаём nginx.conf со следующими данными
![server2](screens/Screenshot_30.png)
#### Указываем,что используем собственную настройку nginx `nginx -с` и путь до nginx.conf
#### Видим страничку
![server3](screens/Screenshot_31.png)

## Part 4. Свой докер
#### Создаём dockerfile
![mine_docker1](screens/Screenshot_32.png)
#### Создаём image командой `docker build -t school:21 .` находясь в директории с Dockerfile
#### Смотрим образы командой `docker images`
![mine_docker2](screens/Screenshot_33.png)
#### В директорию `src/server/nginx` копируем все конфиги с локального nginx кроме созданного в part 3 nginx.conf
#### Создаём и запускаем контейнер через наш image с маппингом порта 80 на локальном хосте, 81 в контейнере и маппингом папок ./server/nginx в папку /etc/nginx в контейнере, чтобы настройки контейнер брал с нашего локального хоста
![mine_docker3](screens/Screenshot_34.png)
#### Видим вывод нашего fcgi сервера
![mine_docker4](screens/Screenshot_35.png)
#### Добавляем в ./server/nginx/nginx.conf настройки вывода статуса
![mine_docker5](screens/Screenshot_36.png)
#### Перезапускаем контейнер и проверяем вывод статуса
![mine_docker6](screens/Screenshot_37.png)
## Part 5. Dockle
#### Устанавливаем dockle
```bash
VERSION=$(
 curl --silent "https://api.github.com/repos/goodwithtech/dockle/releases/latest" | \
 grep '"tag_name":' | \
 sed -E 's/.*"v([^"]+)".*/\1/' \
) && curl -L -o dockle.deb https://github.com/goodwithtech/dockle/releases/download/v${VERSION}/dockle_${VERSION}_Linux-64bit.deb
$ sudo dpkg -i dockle.deb && rm dockle.deb
```
#### При скане образа созданного с помощью докерфайла из part 4, наблюдаем следующие ошибки
![dockle1](screens/Screenshot_38.png)
![dockle2](screens/Screenshot_39.png)
#### Создаём новый dockerfile
![dockle3](screens/Screenshot_40.png)
##### Для исправления ошибки CIS-DI-0010 берём другую версию образа, в нашем случае это образ ubuntu/nginx. Для исправления ошибки DKL-DI-0005 удаляем cache, что и указано в подсказке с dockle. Для устранения warning CIS-DI-0001, создаём пользователя и разрешаем пользователям использовать файлы, связанные с execute nginx и конфиг файлы nginx
#### Создаём новый скрипт, который будет запускать наш пользователь
![dockle6](screens/Screenshot_43.png)
#### Билдим образ
![dockle4](screens/Screenshot_41.png)
#### Запускаем контейнер и проверяем работоспособность его
![dockle5](screens/Screenshot_42.png)
#### Проверяем на ошибки в dockle
![dockle7](screens/Screenshot_44.png)
## Part 6. Базовый Docker Compose
#### Создаём файл `docker-compose.yml`
![compose1](screens/Screenshot_45.png)
##### В контейнере nginx_part5 мы задаём image который будем использовать, указываем volume и сеть, в которой будут общаться наши контейнеры. В контейнере nginx_default делаем тоже самое, только пробрасываем порт контейнера (8080), на порт локального хоста (80) и создаём новый кфг, где указываем настройки проксирования
![compose2](screens/Screenshot_46.png)
##### Устанавливаем порт 8080 для сервера, в resolver указываем ip dns докера, и задаём переменной docker_host , hostname нашего контейнера, в который нужно проксировать запросы
#### Проверяем работоспособность контейнеров
![compose3](screens/Screenshot_47.png)







