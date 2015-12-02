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

;; disable whitespace mode
(setq prelude-whitespace nil)

;; go-autocomplete
(require 'go-autocomplete)

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

(setq tabbar-background-color "#959A79") ;; the color of the tabbar background
(custom-set-faces
 '(tabbar-default ((t (:inherit variable-pitch :background "#959A79" :foreground "black" :weight bold))))
 '(tabbar-button ((t (:inherit tabbar-default :foreground "dark red"))))
 '(tabbar-button-highlight ((t (:inherit tabbar-default))))
 '(tabbar-highlight ((t (:underline t))))
 '(tabbar-selected ((t (:inherit tabbar-default :background "#95CA59"))))
 '(tabbar-separator ((t (:inherit tabbar-default :background "#95CA59"))))
 '(tabbar-unselected ((t (:inherit tabbar-default)))))

(defvar my-tabbar-displayed-buffers
  ;'("*scratch*" "*Messages*" "*Backtrace*" "*Colors*" "*Faces*")
  '("*scratch*" "*Backtrace*" "*Colors*" "*Faces*")
  "*Regexps matches buffer names always included tabs.")
(defun my-tabbar-buffer-list ()
  "Return the list of buffers to show in tabs.
Exclude buffers whose name starts with a space or an asterisk.
The current buffer and buffers matches `my-tabbar-displayed-buffers'
are always included."
  (let* ((hides (list ?\  ?\*))
         (re (regexp-opt my-tabbar-displayed-buffers))
         (cur-buf (current-buffer))
         (tabs (delq nil
                     (mapcar (lambda (buf)
                               (let ((name (buffer-name buf)))
                                 (when (or (string-match re name)
                                           (not (memq (aref name 0) hides)))
                                   buf)))
                             (buffer-list)))))
    ;; Always include the current buffer.
    (if (memq cur-buf tabs)
        tabs
      (cons cur-buf tabs))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

;; set smart cursor
(require 'cursor-change)
(cursor-change-mode)

;; Directly new line and indent
(defun direct-new-line-and-indent nil
    "Directly make a new line and indent from any place"
    (interactive)
    (end-of-line)
    (newline-and-indent))
(global-set-key "\C-j" 'direct-new-line-and-indent)
(global-set-key (kbd "C-c j") 'newline-and-indent)

;; copy line no matters where cursor is
(defun copy-line (&optional arg)
"Save current line into Kill-Ring without mark the line"
(interactive "P")
(let ((beg (line-beginning-position))
    (end (line-end-position arg)))
(copy-region-as-kill beg end))
)
(define-key global-map (kbd "C-c l") 'copy-line)

;; scroll screen without cursor moved
(global-set-key [(meta n)] 'window-move-up)
(global-set-key [(meta p)] 'window-move-down)
(defun window-move-up (&optional arg)
"Current window move-up 2 lines."
(interactive "P")
(if arg
(scroll-up arg)
(scroll-up 2)))

(defun window-move-down (&optional arg)
"Current window move-down 3 lines."
(interactive "P")
(if arg
(scroll-down arg)
(scroll-down 3)))

;; set window size
(setq default-frame-alist
'((height . 35) (width . 135)))

;; set the current frame background and font.
(set-frame-font "-apple-Monaco-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1" nil t)

;; set the font and background for all other frames.
(add-to-list 'default-frame-alist
             '(font .  "-apple-Monaco-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1"))

;; set recent-jump
(setq recent-jump-threshold 4)
(setq recent-jump-ring-length 10)
(global-set-key (kbd "C-S-o") 'recent-jump-jump-backward)
(global-set-key (kbd "M-o") 'recent-jump-jump-forward)
(require 'recent-jump)

;; set transparent
(setq alpha-list '((65 55) (100 100)))

(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    )
  )
(define-key global-map (kbd "C-x p") 'loop-alpha)

;;; customize.el ends here
