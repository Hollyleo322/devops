# Bash-скрипты, часть 4: ввод и вывод

Каждому процессу позволено иметь до девяти открытых дескрипторов файлов. Оболочка bash резервирует первые три дескриптора с идентификаторами 0, 1 и 2. Вот что они означают:
- 0, STDIN — стандартный поток ввода.
- 1, STDOUT — стандартный поток вывода.
- 2, STDERR — стандартный поток ошибок.


### STDIN

Для терминала стандартный ввод — это клавиатура. Когда в сценариях используют символ перенаправления ввода — <, Linux заменяет дескриптор файла стандартного ввода на тот, который указан в команде. Система читает файл и обрабатывает данные так, будто они введены с клавиатуры.

Посмотрим на перенаправление ввода в действии:

```shell
exec 0< testfile
count=1
while read line
do
echo "Line #$count: $line"
count=$(( $count + 1 ))
done
```

Здесь команда read, при попытке прочитать данные из STDIN, будет читать их из файла, а не с клавиатуры.

### STDOUT

STDOUT — стандартный поток вывода оболочки. По умолчанию это экран. Большинство bash-команд выводят данные в STDOUT, что приводит к их появлению в консоли. Данные можно перенаправить в файл, присоединяя их к его содержимому, для этого служит команда >>, например:

```shell
pwd >> myfile
```

То, что выведет pwd, будет добавлено к файлу myfile, при этом уже имеющиеся в нём данные никуда не денутся.

Если в скрипте нужно перенаправлять много выводимых на экран данных, добавлять соответствующую команду к каждому вызову echo неудобно. Вместо этого можно задать перенаправление вывода в определённый дескриптор на время выполнения скрипта, воспользовавшись командой exec:
```shell
exec 1>outfile
```
