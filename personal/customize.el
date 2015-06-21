;;; package --- Summary:
;;; Commentary:
;;; customize for hanks

;;; Code:

;; no scroll bar
(set-scroll-bar-mode nil)

;; show line number
(require 'linum+)
(global-linum-mode t)

;; I prefer command key for meta
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

;; YASnippet
(require 'yasnippet-bundle)
(setq yas/root-directory "~/.emacs.d/personal/snippets")
(yas/load-directory yas/root-directory)

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
               "~/.emacs.d/modules/ac-dict")
(ac-config-default)
(global-auto-complete-mode t)

;; set no backup files
(setq make-backup-files nil)

;; time in status bar
(display-time)

;; set title
(setq frame-title-format
      '("Hanks Is Geek!@%S" (buffer-file-name "%f"
                   (dired-directory dired-directory "%b"))))

;; no alert sound
(setq visible-bell t)

;; desktop save session
(desktop-save-mode 1)

;; set tabbar
(require 'tabbar)
(tabbar-mode t)
(global-set-key (kbd "M--") 'tabbar-backward-group)
(global-set-key (kbd "M-=") 'tabbar-forward-group)
(global-set-key (kbd "M-1") 'tabbar-backward)
(global-set-key (kbd "M-2") 'tabbar-forward)

;; use tabbar
(setq tabbar-buffer-groups-function
          (lambda ()
            (list "All"))) ;; code by Peter Barabas

;; set smart cursor
(require 'cursor-change)
(cursor-change-mode)

;;; customize.el ends here
