;(require 'git)

(font-lock-mode t)
(setq-default line-number-mode t)
(setq-default column-number-mode t)
(setq-default indent-tabs-mode nil)
;(setq-default cperl-font-lock t)

;(add-menu-item nil "Top" 'beginning-of-buffer t)
;(add-menu-item nil "<<<" 'scroll-down t)
;(add-menu-item nil " . " 'recenter t)
;(add-menu-item nil ">>>" 'scroll-up t)
;(add-menu-item nil "Bot" 'end-of-buffer t)

(paren-set-mode 'paren)

(set-face-background 'default "gray90")

(set-face-foreground 'font-lock-string-face "green4")
(set-face-background 'font-lock-string-face "gray85")
;(copy-face 'italic 'font-lock-comment-face)
;(copy-face 'bold 'font-lock-comment-name-face)
;(set-face-foreground 'font-lock-doc-string-face "green4")
;(set-face-background 'font-lock-doc-string-face "gray90")
(set-face-foreground 'font-lock-comment-face "blue")
(set-face-background 'font-lock-comment-face "gray")
(set-face-foreground 'font-lock-keyword-face "red2")
(set-face-foreground 'font-lock-function-name-face "magenta")
(set-face-foreground 'font-lock-type-face "green3")
(set-face-foreground 'font-lock-variable-name-face "blue2")
;(set-face-foreground 'font-lock-reference-face "red3")
(set-face-foreground 'font-lock-preprocessor-face "blue3")
(set-face-background 'paren-match "lightyellow2")

;(global-unset-key "\C-z")
;(global-unset-key [?\C-z ?\C-z])
;(define-key global-map [?\C-z ?\`] 'previous-error)

(define-key global-map [?\C-c ?i] 'indent-region)
(define-key global-map [?\C-c ?u] 'untabify)
(define-key global-map [?\C-c ?o] 'compile)
(define-key global-map [?\C-c ?d] 'kill-comment)
(define-key global-map [?\C-c ?%] 'tags-query-replace)
(define-key global-map [?\C-x ?!] 'previous-error)
;(define-key global-map [?\C-x ?:] 'goto-line)

(add-hook 'c-mode-hook
  (function (lambda ()
    (c-set-style "gnu"))))

(add-hook 'c++-mode-hook
  (function (lambda ()
    (c-set-style "gnu"))))

(add-hook 'cperl-mode-hook
  (function (lambda ()
    (cperl-set-style "CPerl"))))

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(setq interpreter-mode-alist
  (cons '("python" . python-mode)
    interpreter-mode-alist)
  python-mode-hook
  '(lambda () (progn
    (set-variable 'py-indent-offset 2)
    (set-variable 'py-smart-indentation nil)
    (set-variable 'indent-tabs-mode nil) 
    (define-key python-mode-map "\C-m" 'newline-and-indent))))

;(setq minibuffer-max-depth nil)

;(load "/Users/chrispenkett/src/python-mode-1.0/python-mode.el")
