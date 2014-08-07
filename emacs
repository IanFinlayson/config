; .emacs file

; add MELPA package reposItory
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

; make emacs follow symlinks
(setq vc-follow-symlinks nil)

; load a nice color scheme
(load-theme 'solarized-dark t)

; make emacs save backups in a central place
(setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-file-name-transforms `((".*" "~/.saves" t)))
(setq backup-by-copying t)

; turn on Vim emulation!
(require 'evil)
(evil-mode 1)

; turn off the ridiculous menu bar
(menu-bar-mode -1)

; turn on line numbers
(global-linum-mode 1)
(setq linum-format "%d ")

; turn off the mode line
(setq-default mode-line-format nil) 

; turn off the annoying popups
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)

; turn off the scratch message in empty buffers
(setq initial-scratch-message "")

; make emacs accept one letter answers and like it
(defalias 'yes-or-no-p 'y-or-n-p)

; use a sane indentation for C code
(setq c-default-style "k&r" c-basic-offset 4)

; make emacs start where I left off
(setq save-place-file "~/.emacsinfo")
(setq-default save-place t)
(require 'saveplace)

; make the tab key complete if at end of a word
(require 'smart-tab)
(global-smart-tab-mode 1)

; expand tabs into spaces!
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

; setup SLIME
(require 'slime-autoloads)
(setq inferior-lisp-program "/usr/bin/sbcl")

