(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq ring-bell-function 'ignore)

(setq make-backup-files nil)
(global-set-key "\C-h" 'backward-delete-char-untabify)

;; color
(set-background-color "Black")
(set-foreground-color "Green")
(set-cursor-color "Gray")
(add-to-list 'default-frame-alist '(alpha . 92))

;; indentation
(setq-default c-basic-offset 4 tab-width 4 indent-tabs-mode nil)

(add-to-list 'load-path "~/.emacs.d/lisp")

;; php-mode - psr-2
(require 'php-mode)
(add-hook 'php-mode-hook (lambda ()
    (defun ywb-php-lineup-arglist-intro (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (+ (current-column) c-basic-offset))))
    (defun ywb-php-lineup-arglist-close (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (current-column))))
    (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
    (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)))

;; dart-mode
(require 'dart-mode)

;; package
(require 'package)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
;; 初期化
(package-initialize)
