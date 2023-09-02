;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)

(package! irony :disable t)
(package! rtags :disable t)
(package! ccls :disable t)

(unpin! dap-mode)

;; (package! ein :pin "c629877ce3a6a14f00468c0025919080c85a216367e6847ae6341ab7fc7488f5eb8c")

(package! pyim-basedict
  :recipe (:host nil :repo "https://github.com/tumashu/pyim-basedict.git"
           :files ("*.el" "*.pyim")))

;; (package! gitconfig-mode
;; 	  :recipe (:host github :repo "magit/git-modes"
;; 			 :files ("gitconfig-mode.el")))
;; (package! gitignore-mode
;; 	  :recipe (:host github :repo "magit/git-modes"
;; 			 :files ("gitignore-mode.el")))


;; (package! cnfonts
;;   :recipe (:host github :repo "tumashu/cnfonts"
;; 	   :files ("*.el")))

(package! google-c-style
  :recipe (:host github :repo "google/styleguide" :branch "gh-pages"))

;; (package! dirvish
;;   :recipe (:host github :repo "alexluigit/dirvish" :branch "main"))

(package! aggressive-indent)
(package! key-quiz)
(package! fish-completion)

;;; ui
(package! page-break-lines)
(package! info-colors)

;; (package! beacon)
(unpin! docker)
(package! docker
  :recipe (:host github :repo "iexpos/docker.el" :branch "master"))

(package! company-tabnine :recipe (:host github :repo "TommyX12/company-tabnine"))
