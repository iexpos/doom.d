;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
(setq kill-whole-line t)

(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                              ; Stretch cursor to the glyph width

(display-time-mode 1)
(setq display-time-24hr-format 1)
(setq display-time-default-load-average nil)
(setq display-time-day-and-date 1)

(setq scroll-margin 4)

(setq evil-vsplit-window-right t
      evil-split-window-below t)

(setq dired-omit-extensions nil)

(add-hook 'server-switch-hook (lambda () (select-frame-set-input-focus (selected-frame))))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "kun liu"
      user-mail-address "iexpos@163.com")

(set-frame-parameter (selected-frame) 'alpha '(96 . 92))
(add-to-list 'default-frame-alist '(alpha . (96 . 92)))

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;; JetBrainsMono Nerd Font
;; SauceCodePro Nerd Font
;; (setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 22 )
;;       doom-variable-pitch-font (font-spec :family "Ubuntu" :size 24)
;;       doom-big-font (font-spec :family "JetBrainsMono Nerd Font" :size 24))
(setq doom-font (font-spec :family "SauceCodePro Nerd Font" :size 22 )
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 24)
      doom-big-font (font-spec :family "SauceCodePro Nerd Font" :size 24))
;; (setq doom-emoji-fallback-font-families nil)

;; Set font for chinese characters
;; Font should be twice the width of asci chars so that org tables align
;; This will break if run in terminal mode, so use conditional to only run for GUI.
;; (if (display-graphic-p)
;;     (dolist (charset '(kana han cjk-misc bopomofo))
;;       (set-fontset-font (frame-parameter nil 'font)
;;                         charset (font-spec :family "Hiragino Sans GB" :size 18))))
;; (cnfonts-mode 1)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

;; circle theme depending on time
;; (defun my/circle-theme ()
;;   (interactive)
;;   (let ((cur (string-to-number (substring (current-time-string) 11 13))))
;;     (if (member cur (number-sequence 8 18))
;;         (unless (equal 'doom-one-light doom-theme)
;;           (setq doom-theme 'doom-one-light))
;;       ;; (unless (equal 'doom-one doom-theme)
;;       ;;   (setq doom-theme 'doom-one)))))
;;       (unless (equal 'doom-dracula doom-theme)
;;         (setq doom-theme 'doom-dracula)))))
;; (my/circle-theme)

(setq doom-theme 'doom-dracula)
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-one-light)
;; (setq doom-theme 'doom-acario-light)
;; (setq doom-theme 'doom-nord)
;; (setq doom-theme 'doom-srcery
;;       doom-themes-treemacs-theme 'doom-colors
;;       doom-acario-dark-brighter-modeline t
;;       doom-acario-light-brighter-modeline t
;;       doom-nohl-light-brighter-comments t
;;       doom-nohl-dark-brighter-comments t)

;; (after! doom-modeline
;;   (doom-modeline-def-modeline 'main
;;     '(bar matches buffer-info remote-host buffer-position parrot selection-info)
;;     '(misc-info minor-modes checker input-method buffer-encoding major-mode process vcs "  "))) ; <-- added padding here

(custom-set-faces!
  '(mode-line :family "JetBrainsMono Nerd Font" :height 1.0)
  '(mode-line-inactive :family "JetBrainsMono Nerd Font" :height 1.0))

;;;; Org and Treemacs
(doom-themes-treemacs-config)
(doom-themes-org-config)

;;;; Splash Image
(setq fancy-splash-image (expand-file-name "~/.doom.d/splash_emacs.xpm"))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")
(setq org-directory "~/agenda/")

(after! org
  (setq org-log-done t)
  (setq org-log-into-drawer t))
;; (setq org-fontify-quote-and-verse-blocks nil
;;       org-fontify-whole-heading-line nil
;;       org-hide-leading-stars nil
;;       org-startup-indented nil))

(after! evil-textobj-anyblock
  (setq evil-textobj-anyblock-blocks
        '(("(" . ")")
          ("{" . "}")
          ("\\[" . "\\]")
          ("<" . ">")
          ("'" . "'")
          ("\"" . "\"")
          ("`" . "`")
          ("“" . "”"))))


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type t)
;; (setq display-line-numbers-type 'relative)
;; (setq linum-relative-current-symbol "")

(setq display-line-numbers-type nil)

(setq treemacs-width 60)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; (setq exec-path (append exec-path '("/usr/local/bin")))


;; (setq lsp-clangd-version "13.0.0")
(setq lsp-clients-clangd-args '("-j=12"
                                "--clang-tidy"
                                "--background-index"
                                ;; "-log=verbose"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))
(after! lsp-clangd
  (set-lsp-priority! 'clangd 4)
  (setq lsp-headerline-breadcrumb-enable t)
  (setq lsp-lens-enable t))

;; ccls is slowly when file is large!!!
;; (setq lsp-ui-doc-enable nil)
;; (after! ccls
;;   (setq ccls-initialization-options '(:index (:threads 20) :index (:comments 0) :completion (:detailedLabel t)))
;;   (set-lsp-priority! 'ccls 2)) ; optional as ccls is the default in Doom


;; (after! pyim
;;   (setq pyim-page-tooltip 'popup)
;;   (if (posframe-workable-p)
;;       (setq pyim-page-tooltip 'posframe)
;;     (setq pyim-page-tooltip 'popup))
;;   (setq pyim-punctuation-translate-p '(auto yes no))
;;   (pyim-basedict-enable))

(after! company
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 2)
  (setq company-show-quick-access 1)
  (add-hook 'evil-normal-state-entry-hook #'company-abort)) ;; make aborting less annoying.


(setq-default history-length 1000)
(setq-default prescient-history-length 1000)


;; You don’t need org-babel-do-load-languages: Common mistakes
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((emacs-lisp . t) ;; Other languages
;;    (shell . t)
;;    ;; Python & Jupyter
;;    (python . t)
;;    (jupyter . t)))

;; (org-babel-jupyter-override-src-block "python")

;;;; babel colorful output with supportting ansi
(defun lk/babel-ansi ()
  (when-let ((beg (org-babel-where-is-src-block-result nil nil)))
    (save-excursion
      (goto-char beg)
      (when (looking-at org-babel-result-regexp)
        (let ((end (org-babel-result-end))
              (ansi-color-context-region nil))
          (ansi-color-apply-on-region beg end))))))

(add-hook 'org-babel-after-execute-hook 'lk/babel-ansi)
(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)

(defun adviced:org-babel-execute-src-block (&optional orig-fun arg info params)
  (interactive "p")
  (let ((re "^[ \t]*#\\+BEGIN_SRC")
        (case-fold-search t)
        (search-fn #'re-search-backward)
        (count 1)
        (origin (point))
        last-element)
    (end-of-line)
    (while (and (> count 0) (funcall search-fn re nil t))
      (let ((element (save-excursion
		       (goto-char (match-beginning 0))
		       (save-match-data (org-element-at-point)))))
        (when (and (memq (org-element-type element)
		         '(center-block comment-block dynamic-block
				        example-block export-block quote-block
				        special-block src-block verse-block))
		   (<= (match-beginning 0)
		       (org-element-property :post-affiliated element)))
	  (setq last-element element)
	  (cl-decf count))))
    (if (= count 0)
        (prog1 (goto-char (org-element-property :post-affiliated last-element))
	  (save-match-data (org-show-context)))
      (user-error "No %s code blocks" "previous"))
    (if (and (fboundp 'jupyter-org-request-at-point) (jupyter-org-request-at-point))
        (message "Current babel is executing...")
      (funcall orig-fun arg info params))
    (goto-char origin)))
(advice-add 'org-babel-execute-src-block :around 'adviced:org-babel-execute-src-block)
;; (advice-remove 'org-babel-execute-src-block #'adviced:org-babel-execute-src-block)

;; (setq ob-async-no-async-languages-alist '("python" "jupyter-python"))

;; (setq org-babel-default-header-args:jupyter-python
;;       '((:kernel . "python3")
;;         (:pandoc . "t")
;;         (:noweb . "no")
;;         (:async . "no")))

(add-hook 'python-mode-hook
          (lambda ()
            (modify-syntax-entry ?_ "w")
            (modify-syntax-entry ?- "w")))
(add-hook 'c-mode-hook
          (lambda ()
            (modify-syntax-entry ?_ "w")
            (modify-syntax-entry ?- "w")))
(add-hook 'c++-mode-hook
          (lambda ()
            (modify-syntax-entry ?_ "w")
            (modify-syntax-entry ?- "w")))

(custom-set-variables
 '(lsp-pyright-typechecking-mode "off")
 )

(setq +python-ipython-repl-args '("-i" "--simple-prompt" "--no-color-info"))
(setq +python-jupyter-repl-args '("--simple-prompt" "--no-color-info"))



;;;; Fish
(when (and (executable-find "fish")
           (require 'fish-completion nil t))
  (global-fish-completion-mode))


;;;; rust
(after! rustic
  (set-formatter! 'rustic-mode #'rustic-cargo-fmt)
  (setq rustic-lsp-server 'rust-analyzer)
  ;; rustic-format-on-save t
  (setq rustic-lsp-server 'rls))

(set-popup-rule!
  "^\\*rust"
  :slot -2
  :size 0.45
  :side 'right
  :autosave t
  :quit 'current
  :ttl nil
  :modeline t)

(custom-set-faces!
  `(lsp-rust-analyzer-inlay-face :inherit lsp-details-face))

;; (after! lsp-rust
;;   (require 'dap-gdb-lldb))
(after! lsp-pylsp
  (setq dap-python-debugger 'debugpy)
  (setq dap-print-io 't))
(after! lsp-pyls
  (setq dap-python-debugger 'debugpy)
  (setq dap-print-io 't))

(after! lsp-rust
  (setq lsp-rust-analyzer-lru-capacity 10
        lsp-rust-analyzer-server-display-inlay-hints t
        lsp-rust-analyzer-display-chaining-hints t
        lsp-rust-analyzer-display-parameter-hints nil
        lsp-rust-analyzer-cargo-watch-enable t
        lsp-rust-analyzer-cargo-run-build-scripts t
        lsp-rust-analyzer-proc-macro-enable t
        lsp-rust-analyzer-cargo-watch-command "clippy")
  ;; (setq dap-cpptools-extension-version "1.7.1")
  ;; (require 'dap-cpptools))
  (require 'dap-codelldb))

(after! dap-codelldb
  (custom-set-variables
   '(dap-codelldb-debug-path "/home/liukun/.vscode/extensions/vadimcn.vscode-lldb-1.6.10/adapter/codelldb")))
;; (dap-register-debug-template "Rust::Codelldb Run Configuration"
;;                              (list :type "codelldb"
;;                                    :request "launch"
;;                                    :name "Debug executable 'drg'"
;;                                    :program "${workspaceFolder}/target/debug/drg"
;;                                    :args ["clap"]
;;                                    :cwd "${workspaceFolder}/target/debug/"
;;                                    ;; :console "external"
;;                                    :dap-compilation "cargo build"
;;                                    :dap-compilation-dir "${workspaceFolder}")))

;; (after! dap-cpptools
;;   (dap-register-debug-template "Rust::CppTools Run Configuration"
;;                                (list :type "cppdbg"
;;                                      :request "launch"
;;                                      :name "Rust::Run"
;;                                      :MIMode "gdb"
;;                                      :miDebuggerPath "/home/liukun/.cargo/bin/rust-gdb"
;;                                      :environment []
;;                                      :program "${workspaceFolder}/target/debug/drg"
;;                                      :args ["~/Code"]
;;                                      :cwd "${workspaceFolder}"
;;                                      :console "external"
;;                                      :dap-compilation "cargo build"
;;                                      :dap-compilation-dir "${workspaceFolder}")))

(after! dap-mode
  ;; (custom-set-variables
  ;;  '(dap-ui-locals-expand-depth 1))
  ;; (setq dap-ui-buffer-configurations
  ;;       `((,dap-ui--locals-buffer . ((side . right) (slot . 1) (window-width . 0.20)))
  ;;         (,dap-ui--expressions-buffer . ((side . right) (slot . 2) (window-width . 0.20)))
  ;;         (,dap-ui--sessions-buffer . ((side . right) (slot . 3) (window-width . 0.20)))
  ;;         (,dap-ui--breakpoints-buffer . ((side . left) (slot . 2) (window-width . 0.15)))
  ;;         (,dap-ui--debug-window-buffer . ((side . bottom) (slot . 3) (window-width . 0.20)))
  ;;         (,dap-ui--repl-buffer . ((side . bottom) (slot . 1) (window-height . 0.45)))))
  (setq dap-default-terminal-kind "integrated")
  (dap-auto-configure-mode +1))

(add-hook 'dap-stopped-hook
          (lambda (_arg) (call-interactively #'dap-hydra)))

;;;; Key Quiz
(use-package! key-quiz
  :commands (key-quiz)
  :init
  (setq key-quiz-matching-regexp "^<?[MCSgz]"))

;;;; Aggressive Indent
(use-package! aggressive-indent
  :commands (aggressive-indent-mode))
;; Add hooks for messy code like (my) elisp and CSS
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)

(after! swiper
  (setq swiper-goto-start-of-match t))

;;;; Info colors
(use-package! info-colors
  :hook (Info-selection . info-colors-fontify-node))

;;;; Page Break Lines
(use-package! page-break-lines
  :init
  (setq page-break-lines-modes '(emacs-lisp-mode lisp-mode scheme-mode compilation-mode outline-mode help-mode))
  :commands (global-page-break-lines-mode page-break-lines-mode))

(global-page-break-lines-mode)


;;;; google-c-style
(use-package! google-c-style
  :after cc-mode
  :config
  (c-add-style "Google" google-c-style))



