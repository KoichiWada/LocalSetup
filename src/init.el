;; 基本設定
; 言語を日本語にする
(set-language-environment 'Japanese)
; UTF-8とする
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
; 起動時の画面はいらない
(setq inhibit-startup-message t)
; メニューバーを隠す
(tool-bar-mode -1)
; 行番号を常に表示する
;(global-linum-mode t)
; バックアップファイルを作らない
(setq make-backup-files nil)
; ビープを鳴らさない
(setq visible-bell t)
(setq ring-bell-function 'ignore)
; ホームディレクトリを初期ディレクトリにする
(cd "~/")
; Ctrl-h を削除にする
(global-set-key "\C-h" 'backward-delete-char-untabify)
; Ctrl-z を Undo にする
(global-set-key "\C-z" 'undo) 

;; 色設定
(if window-system
    (progn
      ;; 文字の色を設定します。 
      (add-to-list 'default-frame-alist '(foreground-color . "green")) 
      ;; 背景色を設定します。 
      (add-to-list 'default-frame-alist '(background-color . "black")) 
      ;; カーソルの色を設定します。 
      (add-to-list 'default-frame-alist '(cursor-color . "yellow")) 
      ;; マウスポインタの色を設定します。 
      (add-to-list 'default-frame-alist '(mouse-color . "SlateBlue2")) 
      ;; 選択中のリージョンの色を設定します。 
      (set-face-background 'region "deeppink1") 
      )
  )

; デフォルトの透明度を設定する (85%) 
(add-to-list 'default-frame-alist '(alpha . 85))
; カレントウィンドウの透明度を変更する (85%) 
(set-frame-parameter nil 'alpha 0.85) 

;; Font設定
(set-face-attribute 'default nil :family "monaco" :height 140)
(set-fontset-font
  (frame-parameter nil 'font)
    'japanese-jisx0208
    '("Hiragino Kaku Gothic ProN" . "iso10646-1"))
(set-fontset-font
  (frame-parameter nil 'font)
    'japanese-jisx0212
    '("Hiragino Kaku Gothic ProN" . "iso10646-1")) 
(set-fontset-font
  (frame-parameter nil 'font)
    'mule-unicode-0100-24ff
    '("monaco" . "iso10646-1"))
(setq face-font-rescale-alist
    '(("^-apple-hiragino.*" . 1.2)
      (".*osaka-bold.*" . 1.2)
      (".*osaka-medium.*" . 1.2)
      (".*courier-bold-.*-mac-roman" . 1.0)
      (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
      (".*monaco-bold-.*-mac-roman" . 0.9)
      ("-cdac$" . 1.3)))

;; 起動時のディスプレイサイズ変更(環境に応じて適宜変更)
(set-frame-height (next-frame) 40)
(set-frame-width (next-frame) 80)

;; indentation
(setq-default c-basic-offset 4 tab-width 4 indent-tabs-mode nil)

;; load-path
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install/"))

;; auto-install
(require 'auto-install)
;(setq auto-install-directory "~/.emacs.d/auto-install")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;; package
(require 'package)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
;; 初期化
(package-initialize)

;; php-mode
(require 'php-mode)
; PEAR規約のインデント設定にする
(setq php-mode-force-pear t)
; *.phpのファイルのときにphp-modeを自動起動する
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
;  psr-2
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
;(require 'dart-mode)
