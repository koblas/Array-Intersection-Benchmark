
DIRS=c++ ruby python perl php haskell

bench: 
	@for dir in $(DIRS); do \
		echo $$dir ; \
		$(MAKE) --no-print-directory -C $$dir bench; \
	done
