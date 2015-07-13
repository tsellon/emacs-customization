;; packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                        ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")))
(package-initialize)

(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(c-basic-offset 2)
 '(c-syntactic-indentation-in-macros t)
 '(case-fold-search t)
 '(confirm-kill-emacs (quote y-or-n-p))
 '(current-language-environment "Latin-1")
 '(default-input-method "latin-1-prefix")
 '(global-font-lock-mode t nil (font-lock))
 '(indent-tabs-mode nil)
 '(save-place t nil (saveplace))
 '(show-paren-mode t nil (paren))
 '(tab-width 2)
 '(tool-bar-mode nil))
(delete-selection-mode)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; some basic settings
(put 'downcase-region 'disabled nil)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(desktop-save-mode 1)

(setq c-offsets-alist
     '((substatement-open . 0)))
(setq visible-bell t)

;; My personal keys
(global-set-key [f1] 'shell)
(global-set-key [f5] 'revert-buffer)
(global-set-key [f7] 'toggle-truncate-lines)

;; Org-mode stuff
;(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;; Helm settings
;(require 'helm-config)

;; Python stuff
(require 'python)
(setq python-shell-interpreter "ipython")

;;Haskell Mode
(load "~/Library/emacs/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(global-set-key [(control meta down-mouse-3)] 'imenu)

;;To get mouse working in iterm2
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda ()
                               (interactive)
                               (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                               (interactive)
                               (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t))

;; Git
(add-to-list 'load-path "/usr/local/Cellar/git/2.4.5/share/git-core/contrib/emacs")
(require 'git)
(require 'git-blame)

;; Ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-create-new-buffer 'always) ;; other options are 'prompt and 'never
(setq ido-file-extensions-order '(".org" ".txt" ".py" ".h" ".cpp" ".c" ".emacs" ".xml" ".cfg"))

(server-start)
