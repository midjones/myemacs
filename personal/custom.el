(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#3f3f3f" "#cc9393" "#7f9f7f" "#f0dfaf" "#8cd0d3" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(ansi-term-color-vector [unspecified "#2d2d2d" "#f2777a" "#99cc99" "#ffcc66" "#6699cc" "#cc99cc" "#6699cc" "#cccccc"])
 '(custom-safe-themes (quote ("5a4c9d7aaa72be3243323de2e1798aa45ed7d0b20638fd0c093676b804f21822" "a64e1e2ead17a9322f6011f6af30f41bd6c2b3bbbf5e62700c8c3717aac36cbf" "5e2ade7f65d9162ca2ba806908049fb37d602d59d90dc3a08463e1a042f177ae" "4d66773cc6d32566eaf2c9c7ce11269d9eb26e428a1a4fa10e97bae46ff615da" "79362f5a1dfa44cc2625aa4e171f9b203d29e4800ae072b3070599c3f81a8f6e" "d05303816026cec734e26b59e72bb9e46480205e15a8a011c62536a537c29a1a" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "bf7ed640479049f1d74319ed004a9821072c1d9331bc1147e01d22748c18ebdf" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fci-rule-color "#383838"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; add line numbers to the left hand side
(global-linum-mode t)

(setq load-path  (cons (expand-file-name "~/.emacs.d/personal/") load-path))
(add-hook 'prog-mode-hook 'whitespace-turn-off t)
;(load-file "~/.emacs.d/personal/psvn.el")
(require 'psvn)

;(load-file "~/.emacs.d/personal/tortoise-svn.el")
;(require 'tortoise-svn)

;(require 'dsvn)
;(autoload 'svn-status "dsvn" "Run `svn status'." t)
;(autoload 'svn-update "dsvn" "Run `svn update'." t)

;; cf. http://svn.haxx.se/dev/archive-2011-01/0369.shtml
;(require 'psvn)

;(autoload 'svn-status "dsvn" "Run `svn status'." t)
;(autoload 'svn-update "dsvn" "Run `svn update'." t)

;(autoload 'python-mode "python-mode" "Python Mode." t)
;(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;(add-to-list 'interpreter-mode-alist '("python" . python-mode))


(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/auto-complete-1.2")
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(require 'python-mode)
;; initialize pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
;; initialize rope
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

(require 'auto-complete)
(global-auto-complete-mode t)

(require 'python-pep8)
(require 'python-pylint)

;; my favourite font (from eclipse)
(set-face-attribute 'default nil :font "-outline-Consolas-normal-normal-normal-mono-*-*-*-*-c-*-windows-1258")

;;;;;;;;;;;;;;;; flymake, pylint, flymake-cursor
(defun flymake-pylint-init ()
  (list python-python-command
        (list "-m" "pylint.lint" "-f" "parseable" buffer-file-name)))

(add-to-list 'flymake-allowed-file-name-masks
              '("\\.py\\'" flymake-pylint-init))

(global-set-key [f3] 'flymake-display-err-menu-for-current-line)
(global-set-key [f4] 'flymake-goto-next-error)
(eval-after-load 'flymake '(require 'flymake-cursor))

;(add-to-list "~/.emacs.d/personal/tomorrow-theme-master/")

;(load-file "~/.emacs.d/personal/tomorrow-theme-master/tomorrow-night-blue-theme.el")

;(tomorrow-night-blue-theme)
;(load-file "~/.emacs.d/personal/tomorrow-theme-master/tomorrow-night-bright-theme.el")
;(tomorrow-night-bright-theme)
;(load-file "~/.emacs.d/personal/tomorrow-theme-master/tomorrow-night-eighties-theme.el")
;(tomorrow-night-eighties-theme)
;(load-file "~/.emacs.d/personal/tomorrow-theme-master/tomorrow-night-theme.el")
;(tomorrow-night-theme)
;(load-file "~/.emacs.d/personal/tomorrow-theme-master/tomorrow-theme.el")
;(tomorrow-theme)


;;;;;;;;;;;;;;; braindead way of auto-complete
;(defun indent-or-expand (arg)
  ;"Either indent according to mode, or expand the word preceding point."
  ;(interactive "*P")
  ;(if (and
       ;(or (bobp) (= ?w (char-syntax (char-before))))
       ;(or (eobp) (not (= ?w (char-syntax (char-after))))))
      ;(dabbrev-expand arg)
    ;(indent-according-to-mode)))


;(defun my-tab-fix ()
  ;(local-set-key [tab] 'indent-or-expand))

;(add-hook 'c-mode-hook          'my-tab-fix)
;(add-hook 'sh-mode-hook         'my-tab-fix)
;(add-hook 'emacs-lisp-mode-hook 'my-tab-fix)
;(add-hook 'python-mode-hook     'my-tab-fix)
;;;;;;;;;;;;;;; \end braindead way of auto-complete
