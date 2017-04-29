####Tutorial: emacs keyboard instruction  
##Foundamental command
c-g: quit
c-x c-f: open a file
c-x c-k: kill the buffer reprsenting a file .... not deleteing a file
g: refresh the dired view of the current directory to see change


##Mouse move command file/buffer/line/word

c-f: move forward one character
c-b: move back one character
M-f: move forward one world
M-b: move back one world

c-x b: switch to a different buffer in a window

c-p: previous line/up
c-n: next line/down
c-a: move to the beginning of the a line
c-e: move to the end of the line

m-<: begining of the buffer
m->: end of the file

c-v: gage down
m-v: page up

c-l: center the screen

##Edit command
c-d: delete a character
m-d: delete a word
c-_: undo
c-w: cut
c-y: yandk/paste

m-u: upper case
m-l: lower case
m-c: capitalize

c-x w: write the buffer to a different file [maybe invalid, use m-x write-to]

##window command
c-x 2: split top/down
c-x 3: split left/right
c-x o: other window

##search
c-s text: search
c-s TEXT: case sensitive search
m-x query-replace <----> m-%
m-x replace-string

m-x grep <enter>

##mark
c-space: start/toggle marking a region

##Auto check

m-$: spell check word
m-x flyspell-mode
m-x ispell-region: check a small region
m-x ispell-buffer: check all of the buffer

##Tools: shell
m-x shell: start a bash command line

##erc
erc: build-in, An Emacs Internet Relay Chat client
m-x erc: start irc inside of emacs

####GUI emacs

##project related
m-x speedbar <enter> or m-x speed <tab> <enter> :list project files
m-x compile
c-x ` : jump to the next error. That ` is a back quote on the top left of the keyboard

