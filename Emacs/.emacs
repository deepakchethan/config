
(require 'package)
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/"))
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;;(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")) 
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(eval-after-load 'auto-complete '(global-auto-complete-mode 1))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (org-pomodoro lorem-ipsum zoom zygospore ace-window ace-link ac-etags easy-jekyll daemons aggressive-indent arduino-mode auto-minor-mode cmake-mode commenter csharp-mode xclip web-beautify web-mode i3wm company-irony company-irony-c-headers flymake-google-cpplint iedit ac-c-headers ac-js2 irony xref-js2 nlinum ac-html ac-html-bootstrap jq-mode js2-mode js2-refactor json-mode ace-jump-mode switch-window undo-tree autopair auto-complete smex helm-swoop company find-file-in-project highlight-indentation ivy pyvenv s yasnippet elpy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'xclip)
(xclip-mode 1)
(require 'aggressive-indent)
(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes 'html-mode)
(require 'yasnippet)
(yas-global-mode 1)
;; For c header files
(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-sources-c-headers)
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-pc-linux-gnu/6.3.1/include"))
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)
;;Configuring elpy for python
(elpy-enable)
(global-undo-tree-mode)
(define-key global-map  (kbd "C-x RET") 'shell)
(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)

(defun my:flymake-google-init()
  (require 'flymake-google-cpplint)
  '(flymake-google-cpplint-command "/usr/lib/python3.6/site-packages/cpplint")
  (flymake-google-cpplint-load)
  )
(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)
;; setup for py3
;; setq is to assign value to one variable

(setq elpy-rpc-python-command "python3")
(setq elpy-shell-interpreter "python3")






;;javascript, jquery
(require 'js2-mode)
(require 'json-mode)
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(require 'js2-refactor)
(require 'xref-js2)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)
(define-key js-mode-map (kbd "M-.") nil)
(add-hook 'js2-mode-hook (lambda ()  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

;; Autocomplete for C,C++,C#
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)




;;Global key bindings
(require 'helm-swoop)
(require 'smex)
(global-set-key (kbd "M-i") 'helm-swoop)			; For helm-swoop
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "M-/") 'undo-tree-visualize)
(global-set-key (kbd "C-M-z") 'switch-window)


;;For setting up the jekyll stuff
(setq easy-jekyll-basedir "~/Git/deepakchethan.github.io/")
(setq easy-jekyll-url "https://deepakchethan.github.io")
