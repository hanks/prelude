;; set window size
(setq default-frame-alist
'((height . 35) (width . 135)))

;; set the current frame background and font.
(set-frame-font "-apple-Monaco-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1" nil t)

;; set the font and background for all other frames.
(add-to-list 'default-frame-alist
             '(font .  "-apple-Monaco-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1"))
