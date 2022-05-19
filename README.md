# infbez_lekcii_polkovnokov


Первое задание по Сетевым Операционным Системам
Описание работы программы

Program1

Указание длины массива.
printf("Enter length of array: ");
scanf("%d", &length);

Выделение памяти для массива. Если память не выделилась, функция malloc вернёт значение NULL.
if ((array = (int * ) malloc(length * sizeof(int))) != NULL)

После этого идет вывод количество байтов, которое было выделено.
printf("Allocated %lu bytes\n", length * sizeof(*array));

Если всё прошло без ошибок, программа очистит выделенную память.
if (array != NULL)
{
free(array);
}


Program2

Выделение памяти для массива элементов типа char.
char * c = (char * ) calloc(100, sizeof(char));

Затем приложение открывает файл foo.txt для чтения и необходимости создания.
int fd = open("foo.txt", O_RDONLY | O_CREAT);

После этого происходит вывод значения дескриптора файла
printf("fd = %d/n", fd);.

Приложение прочтёт из файла 10 байт и запишет полученное количество информации в переменную sz .
sz = read(fd, c, 10);

Программа запишет в конец массива терминальный ноль c[sz] = '\0'; и закроет файл
if (close(fd) < 0)
{
perror("close file error:");
exit(1);
}


Program3

Сначала программа вызывает функцию fork(), которая создаёт дочерний процесс
int pid = fork();

Затем приложение выведет PID процессы в котором находится.
printf("my pid = %i, returned pid = %i\n", getpid(), pid);
printf("my pid = %i, returned pid = %i\n", getpid(), pid);


Program4

В самом начале программа получает сигнал от пользователя и обрабатывает его.
Затем задаётся глобальная переменная-счётчик counter.
int counter = 0;

Также в программе присутствуют две обрабатывающие функции - handler1.
void handler1(int sig)
{
counter++;
printf("counter = %d\n", counter);
/* Flushes the printed string to stdout */
fflush(stdout);
kill(pid, SIGUSR1);
}

И функция handler2
void handler2(int sig)
{
counter += 3;
printf("counter = %d\n", counter);
exit(0);
}
Обработка: Программа привязывает первую функцию обработки к текущему процессу.
Далее если процесс окажется дочерним, сигнал будет обрабатывать функция handler2.


Program5

Программа создаёт массив файловых дескрипторов.
После этого приложение проверит корректность ввода и выведет сообщение об ошибке если такая есть.
if (argc != 2)
and
if (pipe(pipefd) == -1)

Затем программа вызовет fork() для получения PID дочернего процесса. Дальше приложение проверит только что полученный PID. У дочернего элемента этот идентификатор равен нулю. Далее родительский процесс пишет что-либо.
close(pipefd[0]);
write(pipefd[1], argv[1], strlen(argv[1]));
close(pipefd[1]);
wait(NULL);
exit(EXIT_SUCCESS);

А дочерний cчитает данные.
if (cpid == 0)
{
close(pipefd[1]);
while (read(pipefd[0], & buf, 1) > 0)
write(STDOUT_FILENO, & buf, 1);
write(STDOUT_FILENO, "\n", 1);
close(pipefd[0]);
_exit(EXIT_SUCCESS);

Таким образом реализуется общение между процессами с помощью общего канала.


Program6

Сначала программа создаёт дескриптор и канал с правами доступа для всех.
int fd;
int len;
char buf[BUFSIZE];
if (mkfifo(NAMEDPIPE_NAME, 0777))
{
perror("mkfifo");
return 1;
}


После этого запускается бесконечный цикл, в котором приложение прослушивает его.
do {
memset(buf, '\0', BUFSIZE);
if ((len = read(fd, buf, BUFSIZE - 1)) <= 0)
{
perror("read error");
close(fd);
remove(NAMEDPIPE_NAME);
return 0;
}
printf("Incomming message (%d): %s\n", len, buf);
} while (1);

Если программа получила сообщение.
if ((len = read(fd, buf, BUFSIZE - 1)) <= 0)
Производится вывод количество символов (учитывая нуль терминала) и сам текст.


Примеры вывода программы
Все Скришноты работы программ находятся в папке Screenshots_Lec.

Инструкцию по установке и использованию программы
Каждую программу можно скомпилировать с помощью gcc <Program_Name.c>. В директории создастся исполняемый файл a.out. Который можно запустить с помощью ./a.out.
Можно запустить сам Makefile. Запускается как - make all.
После этого в папке каждой программы будет создан исполняемый файл с ней (Extension.out).
Также можно использовать make LecN если не нужны все лекции. Или же make ProgramN если нужна определенная программа.


Платформы где может работать программа:

Ubuntu / Linux - +;
Windows - +;
OS X - -.
*Расшифровка
Extension - расширение программы
LecN – Номер лекции
ProgramN – Номер программы
