"# Docker_Nginx_Apache" 

Создает имидж на основе ubuntu, на которую устанавливаются nginx, apache и systemctl.

Nginx слушает 80 порт и выступает балансировщиком.
Apache2 слушает 8081 и 8082 порты, обрабатывает поступающие от Nginx запросы.

Изменяемые файлы настроек и начальные страницы вынесены в подкаталог settings.

build_image.bat - пример команды создания имиджа.
run_container.bat - пример запуска контейнера на основе собранного ранее имиджа.