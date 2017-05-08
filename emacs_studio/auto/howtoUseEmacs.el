(TeX-add-style-hook
 "howtoUseEmacs"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "fontenc"
    "graphicx"
    "grffile"
    "longtable"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "amssymb"
    "capt-of"
    "hyperref")
   (LaTeX-add-labels
    "sec:orgb93ef2e"
    "sec:org8567fcb"
    "sec:orge18ab9f"
    "sec:org0bab889"
    "sec:org98903d2"
    "sec:orge14e87e"
    "sec:org745ba2a"
    "sec:org7f30348"
    "sec:orgac9fbf8"
    "sec:orgdf84813"
    "sec:org48b556d"
    "sec:orgdd5bda0"
    "sec:org2c70ec6"
    "sec:org315cc50"
    "sec:org38d1dcd"
    "sec:orge4b6fc0"
    "sec:orge9a042c"
    "sec:orgbfa79ef"
    "sec:org018c839"
    "sec:orgb7a6a43"
    "sec:orga5d2bf8"
    "sec:org9b1370c"
    "sec:org2ecdcbf"
    "sec:orgbd602fd"
    "sec:org05e9f29"
    "sec:org4bcbb1b"
    "sec:org97017b6"
    "sec:orgf946979"
    "sec:orgb8f56b7"
    "sec:orgd6b896c"
    "sec:org2257caf"
    "sec:org5146e9f"
    "sec:org1f181fb"
    "sec:org7a0dca9"
    "sec:orgc3631cc"
    "sec:org7a7ca8e"
    "sec:orga698717"
    "sec:org80d1339"
    "sec:org373ad55"
    "sec:orga95cd24"
    "sec:orgb086bde"
    "sec:org54cf4bd"
    "sec:orge5f1d9b"
    "sec:org46b4aba"
    "sec:org78139e1"
    "sec:orgacdecc6"
    "sec:org316d97f"
    "sec:orgae17ab6"
    "sec:org0729716"
    "sec:orgb22abc7"
    "sec:org8a263f2"))
 :latex)

