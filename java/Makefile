FILES = isect_1_java isect_2_java isect_3_java

bench: $(FILES)
	@for file in $(FILES) ; do \
		echo -n $$file ' | '; \
		java $$file ../data.txt ; \
	done

isect_1_java : isect_1_java.java
	javac isect_1_java.java

isect_2_java : isect_2_java.java
	javac isect_2_java.java

isect_3_java : isect_3_java.java
	javac isect_3_java.java
