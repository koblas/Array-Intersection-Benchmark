
FILES = isect_1_php.php isect_2_php.php isect_3_php.php

bench : 
	@for file in $(FILES) ; do \
		echo -n $$file ' | '; \
		php -d error_reporting=0 -d memory_limit=1G $$file ../data.txt ; \
	done
