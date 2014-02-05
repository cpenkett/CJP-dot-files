(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(tool-bar-mode 0)
  ;; (menu-bar-mode 0) 

(font-lock-mode t)
(setq-default line-number-mode t)
(setq-default column-number-mode t)
(setq-default indent-tabs-mode nil)

(show-paren-mode 1)
(setq show-paren-delay 0)

(set-face-background 'default "gray90")

(set-face-foreground 'font-lock-string-face "green4")
(set-face-background 'font-lock-string-face "gray85")
(set-face-foreground 'font-lock-comment-face "blue")
(set-face-background 'font-lock-comment-face "gray")
(set-face-foreground 'font-lock-keyword-face "red2")
(set-face-foreground 'font-lock-function-name-face "magenta")
(set-face-foreground 'font-lock-type-face "green3")
(set-face-foreground 'font-lock-variable-name-face "blue2")
(set-face-foreground 'font-lock-preprocessor-face "blue3")
(set-face-background 'show-paren-match-face "lightyellow2")

(global-set-key "\M-g" 'goto-line)

(define-key global-map [?\C-c ?i] 'indent-region)
(define-key global-map [?\C-c ?u] 'untabify)
(define-key global-map [?\C-c ?o] 'compile)
(define-key global-map [?\C-c ?d] 'kill-comment)
(define-key global-map [?\C-c ?%] 'tags-query-replace)
(define-key global-map [?\C-x ?!] 'previous-error)

(defalias 'perl-mode 'cperl-mode)

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
