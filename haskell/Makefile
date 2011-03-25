
bench: isect_1_haskell isect_2_haskell isect_3_haskell isect_4_haskell
	@echo -n 'isect_1_haskell | '
	@./isect_1_haskell ../data.txt
	@echo -n 'isect_2_haskell | '
	@./isect_2_haskell ../data.txt
	@echo -n 'isect_3_haskell | '
	@./isect_3_haskell ../data.txt
	@echo -n 'isect_4_haskell | '
	@./isect_4_haskell ../data.txt

isect_1_haskell : isect_1_haskell.hs
	ghc --make -O2 isect_1_haskell.hs

isect_2_haskell : isect_2_haskell.hs
	ghc --make -O2 isect_2_haskell.hs

isect_3_haskell : isect_3_haskell.hs
	ghc --make -O2 isect_3_haskell.hs

isect_4_haskell : isect_4_haskell.hs
	ghc --make -O2 isect_4_haskell.hs

