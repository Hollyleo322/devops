## Part 1. Инструмент **ipcalc**
#### 1.1 Сети и маски
##### Адрес сети *192.167.38.54/13*
![adress1](screens/Screenshot_1.png)
##### Маска 255.255.255.0 в других форматах 
![mask1](screens/Screenshot_2.png)
##### Маска /15 в других форматах
![mask2](screens/Screenshot_3.png)
##### Маска 11111111.11111111.11111111.11110000 в других форматах
![mask3](screens/Screenshot_4.png)
##### Минимальный и максимальный хост в сети 12.167.38.4
##### При маске /8
![hostminmax1](screens/Screenshot_5.png)
##### При маске 11111111.11111111.00000000.00000000
![hostminmax2](screens/Screenshot_6.png)
##### При маске 255.255.254.0
![hostminmax3](screens/Screenshot_7.png)
##### При маске /4
![hostminmax4](screens/Screenshot_8.png)
#### 1.2 localhost
##### Вызовем ipcalc с данными в задании ip адресами 194.34.23.100, 127.0.0.2, 127.1.0.1, 128.0.0.1
![localhost1](screens/Screenshot_9.png)
![localhost2](screens/Screenshot_10.png)
![localhost3](screens/Screenshot_11.png)
![localhost4](screens/Screenshot_12.png)
##### Как видно на скриншотах с ip адресами 127.0.0.2, 127.1.0.1 отображено Loopback. 
`Internet Protocol специфицирует сеть loopback. В IPv4 это сеть с префиксом 127.0.0.0/8 (RFC 5735). Наиболее широко используемый IP адрес в механизмах loopback — 127.0.0.1. В IPv4, в него также отражается любой адрес в пределах от 127.0.0.0 до 127.255.255.255. IPv6 определяет единственный адрес для этой функции — 0:0:0:0:0:0:0:1/128 (также записывается как ::1/128) (RFC 4291). Стандартное, официально зарезервированное, доменное имя для этих адресов — localhost `
##### К приложению, работающему на localhost можно обратиться по ip адресам 127.0.0.2, 127.1.0.1

#### 1.3 Диапозоны и сегменты сетей
##### При помощи ipcalc определим к какому виду сети относятся данные в задании адреса
`Некоторые ip адреса зарезервированы под частную сеть и под Loopback - это отоброжает ipcalc. Если ничего не отображено, соответственно адрес публичный`
##### Ip 10.0.0.45 - частный
![privorpubip1](screens/Screenshot_13.png)
##### Ip 134.43.0.2 - публичный 
![privorpubip2](screens/Screenshot_14.png)
##### Ip 192.168.4.2 - частный
![privorpubip3](screens/Screenshot_15.png)
##### Ip 172.20.250.4 - частный
![privorpubip4](screens/Screenshot_16.png)
##### Ip 172.0.2.1 - публичный
![privorpubip5](screens/Screenshot_17.png)
##### Ip 192.172.0.1 - публичный
![privorpubip6](screens/Screenshot_18.png)
##### Ip 172.68.0.2 - публичный
![privorpubip7](screens/Screenshot_19.png)
##### Ip 172.16.255.255 - частный
![privorpubip7](screens/Screenshot_20.png)
##### Ip 10.10.10.10 - частный
![privorpubip8](screens/Screenshot_21.png)
##### Ip 192.169.168.1 - публичный
![privorpubip9](screens/Screenshot_22.png)
##### У сети 10.10.0.0/18 возможно ip адреса шлюза в диапазоне от Hostmin до Hostmax
![privorpubip10](screens/Screenshot_23.png)
##### Т.е. Подходят адреса `10.0.0.1, 10.10.0.2, 10.10.10.10, 10.10.1.255`
## Part 2. Статическая маршрутизация между двумя машинами
##### Сетевые интерфейсы ws1
![staticmarsh1](screens/Screenshot_24.png)
##### Сетевые интерфейсы ws2
![staticmarsh2](screens/Screenshot_25.png)
##### Внутренний интерфейс в нашем случаеш enp0s3, тип подключения в настройках сети vm NAT, по dhcp выдал нам ip 10.0.2.15/24
##### Создаём virtual host adapter и задаём адрес 10.60.60.0 с маской /30
![staticmarsh3](screens/Screenshot_26.png)
##### Указываем в настройках сети ws1  виртуальный адаптер хоста, аналогично во второй машине
![staticmarsh4](screens/Screenshot_27.png)
![staticmarsh5](screens/Screenshot_29.png)
##### Cоздаём второй интерфейс в настройках vm c типом подключения внутренняя сеть на обоих машинах
![staticmarsh6](screens/Screenshot_28.png)
![staticmarsh7](screens/Screenshot_30.png)
##### Задаём настройки интерфейсов в `etc/netplan/00-installer-config.yaml`
![staticmarsh8](screens/Screenshot_31.png)
![staticmarsh9](screens/Screenshot_32.png)
##### Подтверждаем настройки на обоих vm
![staticmarsh10](screens/Screenshot_33.png)
![staticmarsh11](screens/Screenshot_34.png)
#### 2.1 Добавление статического маршрута вручную
##### Задаём маршруты от одной ws1 до ws2 и обратно
![staticmarsh12](screens/Screenshot_35.png)
![staticmarsh13](screens/Screenshot_36.png)
##### Ping с ws1 до ws2
![staticmarsh14](screens/Screenshot_37.png)
##### Ping с ws2 до ws1
![staticmarsh15](screens/Screenshot_38.png)
#### 2.2. Добавление статического маршрута с сохранением
##### Устанавливаем маршрут при помощи редактирования файла `/etc/netplan/00-installer-config.yaml`
###### В ws1
![staticmarsh16](screens/Screenshot_39.png)
###### В ws2
![staticmarsh17](screens/Screenshot_40.png)
##### Пингуем машины между собой
###### В ws1
![staticmarsh18](screens/Screenshot_41.png)
###### В ws2
![staticmarsh19](screens/Screenshot_42.png)
## Part 3. Утилита iperf3
#### 3.1 Скорость соединения
#### Переведём скорость соединения при помощи сайта `gbmb.org`
#### 8 Mbps в MB/s
![speedconnect1](screens/Screenshot_43.png)
#### 100 MB/s в Kbps
![speedconnect2](screens/Screenshot_44.png)
#### 1 Gbps в Mbps
![speedconnect3](screens/Screenshot_45.png)
#### 3.2 Утилита iperf3
#### Установим на две виртуальные машины iperf3 при помощи команды `sudo apt install iperf3`
#### Создаём сервер iperf3 на ws2
![speedconnect4](screens/Screenshot_46.png)
#### Измеряем скорость на клиентской части программы
![speedconnect5](screens/Screenshot_47.png)
## Part 4. Сетевой экран
#### 4.1 Утилита iptables
#### Создаём файл имитирующий файрвол
#### В ws1
![firewall1](screens/Screenshot_48.png)
##### Здесь удаляем правила с таблицы filter, удаляем chains созданные юзером, открываем порт 22 и 80 для tcp протокола, запрещаем, а после разрешаем сообщения echo reply протокола icmp
#### В ws2
![firewall2](screens/Screenshot_49.png)
##### Здесь делаем тоже самое, заисключением порядка правил echo reply. Сначала разрешаем, потом запрещаем
#### Прописываем возможность execute скрипта firewall.sh, запускаем этот скрипт, и смотрим в таблицу filter в ws1 и в ws2
![firewall3](screens/Screenshot_50.png)
![firewall4](screens/Screenshot_51.png)
#### Разница стратегий в том, что в ws1 при получении echo request, echo reply будет блокировано, т.к. это правило стоит первым в нашей таблице, в ws2 же наоборот, правило разрешающее echo reply стоит первым
#### 4.2 утилита nmap
#### Пингуем с ws1 ws2 и наоборот
![firewall5](screens/Screenshot_52.png)
![firewall6](screens/Screenshot_53.png)
#### Как видно на скриншоте, не пингуется ws1 с ws2
#### При помощи утилиты nmap увидим, что хост ws1 запущен
![firewall7](screens/Screenshot_54.png)
## Part 5. Статическая маршрутизация сети
#### 5.1. Настройка адресов машин
#### Содержимое файла `etc/netplan/00-installer-config.yaml` на разных машинах
##### ws11
![netstatic1](screens/Screenshot_55.png)
##### r1
![netstatic2](screens/Screenshot_56.png)
##### r2
![netstatic3](screens/Screenshot_57.png)
##### ws22
![netstatic4](screens/Screenshot_58.png)
#### Проверяем на всех машинах, что адреса заданы верно командой `ip -4 a`
![netstatic5](screens/Screenshot_59.png)
![netstatic6](screens/Screenshot_60.png)
![netstatic7](screens/Screenshot_61.png)
![netstatic8](screens/Screenshot_62.png)
![netstatic9](screens/Screenshot_63.png)
#### Пингуем ws22 с ws21
![netstatic10](screens/Screenshot_64.png)
#### Пингуем r1 c ws11
![netstatic11](screens/Screenshot_65.png)
#### 5.2. Включение переадресации IP-адресов
#### Включаем переадрессацию на роутерах r1 и r2 при помощи команды `sysctl -w net.ipv4.ip_forward=1`
![netstatic12](screens/Screenshot_66.png)
![netstatic13](screens/Screenshot_67.png)
#### Раскомментируем нужную строку в файле `etc/sysctl.conf`
![netstatic14](screens/Screenshot_68.png)
![netstatic15](screens/Screenshot_69.png)
#### 5.3. Установка маршрута по умолчанию
#### Настраиваем маршрут по умолчанию у рабочих станций
##### ws11
![netstatic16](screens/Screenshot_70.png)
##### ws21
![netstatic17](screens/Screenshot_71.png)
##### ws22
![netstatic18](screens/Screenshot_72.png)
#### Вывод таблиц маршрутизации
##### ws11
![netstatic19](screens/Screenshot_73.png)
##### ws21
![netstatic20](screens/Screenshot_74.png)
##### ws22
![netstatic21](screens/Screenshot_75.png)
#### Пингуем с ws11 r2
![netstatic22](screens/Screenshot_77.png)
#### Вывод команды tcpdump `-tn -i enp0s3`
![netstatic23](screens/Screenshot_76.png)
#### 5.4. Добавление статических маршрутов
#### Добавляем в роутеры статические маршруты
##### r1
![nestatic24](screens/Screenshot_78.png)
##### r2
![netstatic25](screens/Screenshot_79.png)
#### Вывод `ip r`
##### r1
![netstatic26](screens/Screenshot_80.png)
##### r2
![netstatic27](screens/Screenshot_81.png)
#### Запуск на ws11 `ip r list`
![netstatic28](screens/Screenshot_82.png)
#### В подсети 10.10.0.0/18 наш хост будет общаться при помощи arp запроса, остальные адреса будут переадресованы к нашему роутеру r1
#### Построение списка маршрутизаторов от ws11 до ws21
##### Скриншот `traceroute` с ws11
![netstatic29](screens/Screenshot_83.png)
##### `tcpdump` в r1
![netstatic30](screens/Screenshot_84.png)
#### Как видно на скриншоте tcpdump r1 утилита traceroute отправляет udp пакеты (сначала с ttl = 1, с несуществующем портом), когда пакет доходит до r1, ttl = 0, r1 отправляет ws11 icmp сообщение `time exceeded in-transit`, после этого traceroute отправляет udp пакет с значением ttl на один больше чем предыдущий, до тех пор пока не получит icmp сообщение, что порт в пакете udp на адрес который он отправлен, недоступен.
#### 5.6. Использование протокола ICMP при маршрутизации
##### Пингуем несуществующий в нашей сети ip адрес
![netstatic31](screens/Screenshot_86.png)
##### tcpdump r1
![netstatic32](screens/Screenshot_85.png)
## Part 6. Динамическая настройка IP с помощью DHCP
#### Устанавливаем dhcp сервер
![netstatic33](screens/Screenshot_93.png)
#### Создаём файл `/etc/dhcp/dhcpd.conf` и вводим следующие параметры
![netstatic34](screens/Screenshot_87.png)
#### Изменяем файл `/etc/resolv.conf`
![netstatic35](screens/Screenshot_88.png)
#### Перезагружаем dhcp сервер
![netstatic36](screens/Screenshot_89.png)
#### Меняем настройки в ws21 на получение интерфейсом данных от dhcp сервера
![netstatic37](screens/Screenshot_90.png)
#### После `sudo netplan apply` видим, что получили данные от dhcp сервера
![netstatic38](screens/Screenshot_91.png)
#### Пингуем с ws22 ws21
![netstatic39](screens/Screenshot_92.png)
#### Указываем mac адрес для ws11 и включаем в нём же возможность получать настройки от dhcp сервера
![netstatic40](screens/Screenshot_94.png)
#### Делаем reboot и выводим mac адрес ws11 через `ip a`
![netstatic41](screens/Screenshot_95.png)
#### Устанавливаем dhcp сервер
![netstatic42](screens/Screenshot_99.png)
#### Создаём в r1 файл `/etc/dhcp/dhcpd.conf`
![netstatic43](screens/Screenshot_96.png)
#### Перезапускаем dhcp сервер
![netstatic44](screens/Screenshot_97.png)
#### Перезапускаем ws11 и проверяем настройки, которые получили от dhcp сервера
![netstatic45](screens/Screenshot_98.png)
#### Пингуем с r1 ws11
![netstatic46](screens/Screenshot_100.png)
#### Отображаем текущий ip в ws21 и стираем его
![netstatic47](screens/Screenshot_101.png)
#### Запрашиваем новый адрес
![netstatic48](screens/Screenshot_102.png)
#### Здесь мы пользуемся клиентом dhcp, опция -r стирает прошлые данные полученные от dhcp сервера, и отключает работу клиента. После снова запускаем клиент, чтобы получить новые данные.
## Part 7. NAT
#### Устанавливаем на ws22 и r1 apache2 с помощью команды `sudo apt install apache2`
#### В файле `/etc/apache2/ports.conf` изменяем `Listen 80 на Listen 0.0.0.0:80`в ws22 и r1
![nat1](screens/Screenshot_103.png)
![nat2](screens/Screenshot_104.png)
#### Запускаем сервера apache2 на ws22 и r1
![nat3](screens/Screenshot_105.png)
![nat4](screens/Screenshot_106.png)
#### Создаём firewall в r2
![nat5](screens/Screenshot_107.png)
#### Даём права на execute и запускаем наш скрипт
![nat6](screens/Screenshot_108.png)
#### Видим что ответа от r1 нет
![nat7](screens/Screenshot_109.png)
#### Добавляем правило на допуск маршрутизации icmp пакетов
![nat8](screens/Screenshot_110.png)
#### Запускаем скрипт и смотрим таблицу filter
![nat9](screens/Screenshot_111.png)
##### видим что правило добавилось
#### Пингуем с ws22 r1
![nat10](screens/Screenshot_112.png)
#### Добавляем в r2 правила SNAT и DNAT, плюс разрешаем переадресацию tcp протокола
![nat11](screens/Screenshot_113.png)
#### Проверяем соединение по tcp SNAT
![nat12](screens/Screenshot_114.png)
#### Также сделаем ping r1 с ws22 и убедимся, что ip отправителя меняется
![nat13](screens/Screenshot_115.png)
#### Проверяем соединение по tcp DNAT
![nat14](screens/Screenshot_116.png)
#### Видим, что правила для SNAT и DNAT работают
## Part8. Знакомство с SSH Tunnels
#### Устанавливаем запуск сервера apache на ws22 на localhost
![tunnel1](screens/Screenshot_117.png)
#### Устанавливаем ssh-server на ws 22
![tunnel2](screens/Screenshot_118.png)
#### Запускаем sshd
![tunnel3](screens/Screenshot_119.png)
#### C ws21 подключаемся к sshd в ws22 
![tunnel14](screens/Screenshot_120.png)
#### Во втором терминале подключаемся к localhost с портом 9999
![tunnel15](screens/Screenshot_121.png)
#### Устанавливаем sshd на ws11 при помощи команды `sudo apt install opnessh-server`
#### Запускаем его
![tunnel16](screens/Screenshot_122.png)
#### С клиента ssh на ws22 подключаемся к ws11
![tunnel17](screens/Screenshot_123.png)
#### С ws11 подключаемся к apache серверу на ws22
![tunnel18](screens/Screenshot_124.png)






