;(require 'git)

(font-lock-mode t)
(setq-default line-number-mode t)
(setq-default column-number-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
;(setq-default cperl-font-lock t)

(setq-default py-indent-offset 2)
(setq-default py-continuation-offset 2)

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
(set-face-foreground 'font-lock-preprocessor-face "blue3")
;(set-face-background 'paren-match "lightyellow2")
(set-face-background 'show-paren-match-face "lightyellow2")


(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(load-home-init-file t t))

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

;(setq minibuffer-max-depth nil)

;(load "/Users/chrispenkett/src/python-mode-1.0/python-mode.el")
