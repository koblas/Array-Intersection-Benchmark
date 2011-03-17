
FILES = isect_1_ruby.rb isect_2_ruby.rb isect_3_ruby.rb isect_4_ruby.rb

bench : 
	@for file in $(FILES) ; do \
		echo -n $$file ' | '; \
		ruby $$file ../data.txt ; \
	done
