all: compileEl

compileEl:
	emacs --batch --eval '(byte-recompile-directory "./lisp" 0)'

clean:
	rm ./lisp/*.elc
