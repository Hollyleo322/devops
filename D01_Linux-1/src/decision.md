## Part 1. Установка ОС
![ВерсияОС](screens/part1.png)

## Part 2. Создание пользователя
- Создаем пользователя при помощи команды sudo
![Создание_пользователя](screens/part2.png)
- Вывод команды `cat /etc/passwd`
![passwrd](screens/part2_2.png)
- Группа пользователя 
![группа](screens/part2_3.png)

## Part3. Настройка сети ОС
- Задаём название машины в настройках Virtual BOX
![Название_машины](screens/part3.png)
- Установка временной зоны
![Текущая_дата](screens/part3_1.png)
![Измененная_дата](screens/part3_2.png)
- Выводим название сетевых интерфейсов
![Сетевые_интерфейсы](screens/part3_3.png)
lo (loopback device) – виртуальный интерфейс, присутствующий по умолчанию в любом Linux. Он используется для отладки сетевых программ и запуска серверных приложений на локальной машине. С этим интерфейсом всегда связан адрес 127.0.0.1. У него есть dns-имя – localhost. Посмотреть привязку можно в файле /etc/hosts.
- ip адрес полученный от DHCP сервера
![ip_dhcp](screens/part3_4.png)
Протокол DHCP — это протокол клиента или сервера, который автоматически предоставляет узел протокола IP с его IP-адресом и другие связанные сведения о конфигурации, такие как маска подсети и шлюз по умолчанию.
- Вывод ip-адреса шлюза
- Изменяем тип подключения на сетевой мост
![ip_шлюз](screens/part3_5.png)\
Вывод внутреннего ip-шлюза
![внутр_ip](screens/part3_6.png)\
Вывод внешнего ip-шлюза
![внешний_ip](screens/part3_7.png)
- Ввод статичных адресов\
Заходим через редактор nano в файл с конфигурацией интернет интерфейса
![interface](screens/part3_8.png)\
Задаём статические адреса\
![nano_file](screens/part3_9.png)\
ip адрес
![ip](screens/part3_10.png)\
ip шлюз\
![ip_шлюз](screens/part3_11.png)\
dns сервера
![dns](screens/part3_12.png)\
ping серверов
![ping1](screens/part3_13.png)
![ping2](screens/part3_14.png)
## Part4. Обновление ОС
![обновление](screens/part4.png)
![обновление2](screens/part4_2.png)
![обновление3](screens/part4_3.png)
## Part5. Использование команды sudo
- Sudo — это утилита, предоставляющая привилегии root для выполнения административных операций в соответствии со своими настройками.
- Устанавливаем пароль пользователю созданному в part 2
![установка_пароля](screens/part5.png)
- Присваиваем пользователю test все привилегии в файле etc/sudoers
![установка_всех_привелегий](screens/part5_2.png)
- Меняем пользователя 
![смена_пользователя](screens/part5_3.png)
- Изменение hostname
![смена_hostname](screens/part5_4.png)
## Part6. Установка и настройка службы времени
- Время часового пояса, в котором сейчас нахожусь
![текущее_время](screens/part6.png)
- Вывод команды `timedatectl show`
![timedatectl](screens/part6_2.png)
## Part7. Установка и использование текстовых редакторов
- Nano и Vim установлены по умолчанию, устанавливаем `MCEDIT`
![mcedit](screens/part7.png)
- Создаём файл через редактор vim `vim test_vim.txt`
- Содержимое файла
![vim](screens/part7_2.png)
- Для выхода с сохранением нужно ввести `:wq` и `enter`
- Создаём файл через редактор nano `nano test_nano.txt`
- Содержимое файла
![nano](screens/part7_3.png)
- Для выхода с сохранением нужно ввести комбинацию клавиш `ctrl +x` и  `Y` после `enter`
- Создаём файл через редактор mcedit `mcedit test_mcedit.txt`
- Содержимое файла
![mcedit](screens/part7_4.png)
- Для сохранения нажимаем `F2`, подтверждаем. Для выхода жмём `F10`
- Открываем файл через `vim`
- Скрин после редактирования
![vim1](screens/part7_5.png)
- Выход без сохранения `:q!` и `enter`
- Открываем файл через `nano`
- Скрин после редактирования
![nano1](screens/part7_6.png)
- Выход без сохранения `ctrl +x` и  `N` после `enter`
- Открываем файл через `mcedit`
- Скрин после редактирования
![mcedit1](screens/part7_7.png)
- Выход без сохранения `F10` и  выбираем `No` после `enter`
- Поиск слова в vim в обычном режиме с помощью клавиш `?` или `/`
![vim2](screens/part7_8.png)
- Замена слова в vim в обычном режими команда `:s/pattern/string`
![vim3](screens/part7_9.png)
- Поиск слова в nano при помощи сочетания `ctrl + w`
![nano2](screens/part7_10.png)
- Для  замены слова следует нажать сочетание `ctrl + \`
![nano3](screens/part7_11.png)
- Поиск слова в mcedit при помощи  `F7`
![mcedit2](screens/part7_12.png)
- Замена слова в mcedit устанавливаем курсор на начало документа и нажимаем `F4`
- Вводим строку которую хотим поменять и строку на которую хотим поменять
![mcedit3](screens/part7_13.png)
## Part8. Установка и базовая настройка сервиса SSHD
- Установка службы SSHd.
![instalssh](screens/part8.png)
- Автостарт службы
![auto](screens/part8_2.png)
- Установка другого порта 
![change_port](screens/part8_3.png)
![change_port2](screens/part8_4.png)
- Процесс sshd
![ps](screens/part8_5.png)
- Команда `ps - выводит отчёт о текущих процессах` ключ A показывает все процессы
- Устанавливаем утилиту `netstat`
![netstat](screens/part8_6.png)
- Вывод `netstat -tan`
![netstat2](screens/part8_7.png)
- Ключи команды netstat `-t` - показывать только протоколы tcp, `-a` - показывать состояния всех сокетов(по умолчанию серверные процессы не показываются) `-n` - отображать адреса в числовой форме
- Столбцы команды `netstat`: `Proto` - протокол. `Recv-Q` - количество байтов, помещенных в буфер приема TCP/IP, но не переданных приложению. `Send-Q` - количество байтов, помещённых в буфер отправки TCP/IP, но не отправленных, или отправленных, но не подтверждённых. `Local address` - локальный адрес сервера. `Foreign address` - адресс с которого пришло подключение. `State` - состояние (listen - ожидает входящих подключений, established - соединение установлено)
- 0.0.0.0 в local address - означает, что подключаться можно ко всем адресам сервера, в foreigh address - означает подключаться можно с любых адресов.
## Part9. Установка и использование утилит top, htop
- **Вывод команды top**
    - uptime 
    ![uptime](screens/part9_2.png)
    - количество авторизованных пользователей
    ![quanusers](screens/part9_3.png)
    - общая загрузка системы
    ![downsystem](screens/part9_4.png)
    - общее количество процессов
    ![quanprocess](screens/part9_5.png)
    - загрузка cpu
    ![cpudown](screens/part9_6.png)
    - загрузка памяти
    ![memdown](screens/part9_7.png)
    - pid процесса, занимающего больше всего памяти
    ![cpu1](screens/part9_9.png)
    - pid процесса, занимающего больше всего процессорного времени
    ![mem](screens/part9_8.png)
- **Вывод команды htop**
    - отсортированный отчет по PID
    ![sort1](screens/part9_10.png)
    - отсортированный отчет по PERCENT_CPU
    ![sort2](screens/part9_11.png)
    - отсортированный отчет по PERCENT_MEM
    ![sort3](screens/part9_12.png)
    - отсортированный отчет по TIME
    ![sort4](screens/part9_13.png)
    - отфильтрованный для процесса sshd
    ![filter](screens/part9_14.png)
    - с процессом syslog,используя поиск
    ![search](screens/part9_15.png)
    - с добавленным выводом hostname, clock и uptime
    ![clock,uptime](screens/part9_16.png)
## Part10. Использование утилиты fdisk
- Название жесткого диска
![namehard](screens/part10_2.png)
- Размер жесткого диска
![sizehard](screens/part10_3.png)
- Количество секторов
![quansectres](screens/part10_4.png)
- Размер swap
![sizeswap](screens/part10_5.png)
## Part11. Использование утилиты df
- Запуск команды df
    - Размер раздела
    ![dfsize](screens/part11_2.png)
    - Размер занятого пространства
    ![dftooksize](screens/part11_3.png)
    - Размер свободного пространства
    ![dfavaisize](screens/part11_4.png)
    - Процент использования
    ![percentofusage](screens/part11_5.png)
    - Единица измерения `килобайты`
- Запуск команды df -Th
    - Размер раздела
    ![dfsize](screens/part11_6.png)
    - Размер занятого пространства
    ![dftooksize](screens/part11_7.png)
    - Размер свободного пространства
    ![dfavaisize](screens/part11_8.png)
    - Процент использования
    ![percentofusage](screens/part11_9.png)
    - Тип файловой системы - ext4 (Extended Filesystem - стандартная файловая система для линукс)
## Part12. Использование утилиты du
- Размер папки /home
![dusize1](screens/part12_2.png)
- Размер папки /var/log
![dusize2](screens/part12_3.png)
- Размер папки /var
![dusize3](screens/part12_4.png)
- Размер всего соержимого /var/log
![dusize4](screens/part12_5.png)
## Part13. Установка и использование утилиты ncdu
- Размер папки /home
![dusize1](screens/part13.png)
- Размер папки /var/log
![dusize2](screens/part13_2.png)
- Размер папки /var
![dusize3](screens/part13_3.png)
## Part14. Работа с системными журналами
- Авторизация указана в журнале /var/log/auth.log
![authe](screens/part14.png)
- Метод входа с указаниеи логина и пароля с помощью библиотеки PAM
- Рестарт sshd
![restartsshd](screens/part14_2.png)
![restartsshd2](screens/part14_3.png)
## Part15. Использование планировщика заданий CRON
- Uptime в журнале
![uptime](screens/part15.png)
- Список задач для CRON
![taskscron](screens/part15_2.png)
- Удаляем задачи для CRON
![notasks](screens/part15_3.png)

