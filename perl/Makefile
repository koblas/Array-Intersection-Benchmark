
FILES = isect_1_perl.pl isect_2_perl.pl isect_3_perl.pl isect_4_perl.pl

bench : 
	@for file in $(FILES) ; do \
		echo -n $$file ' | '; \
		perl $$file ../data.txt ; \
	done
