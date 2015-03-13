; .emacs file

; make emacs save backups in a central place
(setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-file-name-transforms `((".*" "~/.saves" t)))
(setq backup-by-copying t)

; make emacs follow symlinks
(setq vc-follow-symlinks nil)

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

; expand tabs into spaces!
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

; list the packages I need
(setq package-list '(evil smart-tab saveplace))

; add MELPA package reposItory
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

; activate packages
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install all missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

; turn on Vim emulation!
(require 'evil)
(evil-mode 1)

; make emacs start where I left off
(require 'saveplace)
(setq save-place-file "~/.emacsinfo")
(setq-default save-place t)

; make the tab key complete if at end of a word
(require 'smart-tab)
(global-smart-tab-mode 1)

; my color theme

(deftheme ians
  "My own Emacs color theme")
(let ((class '((class color) (min-colors 8))))
  (custom-theme-set-faces
   'ians

   ;normal stuff
   `(default ((,class (:background "darkblack" :foreground "white"))))
   `(cursor ((,class (:background "green" :forefround "green"))))
   `(fringe ((,class (:background "none" :foreground "green"))))
   ; special stuff
   `(font-lock-builtin-face ((,class (:foreground "blue"))))
   `(font-lock-constant-face ((,class (:foreground "cyan"))))
   `(font-lock-keyword-face ((,class (:foreground "blue"))))
   `(font-lock-string-face ((,class (:foreground "cyan"))))
   `(font-lock-comment-face ((,class (:foreground "green"))))
   `(font-lock-warning-face ((,class (:foreground "red"))))
   `(font-lock-type-face ((,class (:foreground "yellow"))))
   `(font-lock-variable-name-face ((,class (:foreground "white"))))
   `(font-lock-function-name-face ((,class (:foreground "white"))))
   `(font-lock-constant-face ((,class (:foreground "cyan"))))
   `(font-lock-warning-face ((,class (:foreground "red"))))))

(provide-theme 'ians)


