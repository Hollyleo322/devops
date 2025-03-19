#!/bin/bash
gcc -Wall -Wextra -Werror -o fcgi_server fcgi.c -lfcgi
spawn-fcgi -p 8080 fcgi_server
nginx -g "daemon off;"