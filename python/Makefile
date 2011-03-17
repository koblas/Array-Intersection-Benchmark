
FILES = isect_1_python.py isect_2_python.py isect_3_python.py isect_4_python.py

bench : 
	@for file in $(FILES) ; do \
		echo -n $$file ' | '; \
		python $$file ../data.txt ; \
	done
