;;;Emacs lisp grammer
;;basement data type
 C-x C-e
123 
"Hello world"
(+ 5 5)
(/ 5 5)

t =>ture
nil=> false

(null '())
(equal nil '())

(setq my-var 80)
(setq my-var 92 my-other-var 10)
(+ my-var my-other-var)

;;;list
(setq my-list '(1 2 3))
my-list

(add-to-list 'my-list 4)
my-list

(cons 5 my-list);;Note: it create a new list ather than modify my-list
my-list ;; the value does not changed
=>result: (4 3 2 1)

;;;"car" and "cdr"
car: contents of the address part of the register
cdr: contents of the decrement part of the register
(car my-list)
(cdr my-list)
my-list

(nth 0 my-list)
(nth 3 my-list)

(member 4 my-list)
(member 9 my-list) => nil

(defun does-exists (number some-list)
  (member number some-list))

(does-exists 8 my-list) =>nil
(does-exists 2 my-list) => (2 3)
(does-exists 3 '(3 4 6))
(require 'ert)
;;ERT=> the emacs lisp regression testing tool
(ert-deftest check-number ()
  (should (does-exists 1 '(1 2 3))))

;; looping and local variables
(setq my-list '( 1 2 3 4))
;; loop through lists and print even numbers
(dolist (pizza my-list)
  (when (= (mod pizza 2) 0)
    (print pizza)))

;;use "let" to define local variables
(let (some-var)
  (when (null some-var)
    (message "var is null")))

(let ((some-var 0)
  (other-var 90))
  (if ( null some-var)
      (message "nont suppose to happern")
    (message "YES")))
;=>YES

(defun sum-evens (some-list)
  (let ((sum 0))
	(dolist (element some-list)
	  (when (= (mod element 2) 0)
	    (setq sum (+ sum element)))
	  )
	sum))
(sum-evens my-list)  

(ert-deftest sum-evens-test ()
  (should (= (sum-evens '(1 3 5)) 0))
  (should (= (sum-evens '(2 4 6)) 12)))
    
(defun add-nums (a b) (+ a b))
(add-nums 1 2) ;;rather than (add-nums (1 2))

;;M-x ert => then input the function name
(ert-deftest add-nums-pos ()
  (should (equal (add-nums 10 10) 20)))

;;;; introduction and Demonstration: htps://www.youtube.com/watch?v=B6jfrrwR10k
;;Create a function that inserts a line 'above' the current cursor position
(defun my/insert-line-before (times)
  "Insert a newline above the line containing the cursor."
  (interactive "p");;called from M-x; "p"->take parameters
  (save-excursion;;start position
    (move-beginning-of-line 1)
    (newline times));;insert new line
  )
;;line 1: line1
;;line 2: line 2

(global-set-key (kbd "C-S-a")
		'my/insert-line-before)

;; Interactive Functions
(defun my/cheap-count-words ()
       "count the words"
       (interactive)
       (let ((words 0))
	 (save-excursion
	   (goto-char (point-min))
	   (while (forward-word)
	     (setq words (1+ words))))
       (message (format "Words in Buffer: %s" words))
       words))

(require 'ert)
;; M-x ert => then input the function name
(ert-deftest cheap-count-test ()
  (get-buffer-create "*test*")
  (with-current-buffer "*test*"
  (erase-buffer)
  (insert "Hello world")Hello world
  (should (= (my/cheap-count-words) 2))
  )
  (kill-buffer "*test*")
  )
