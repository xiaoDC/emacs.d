;;; core-ui.el

(defvar shadow-ui-fringe-size '3
  "Default fringe width")

(defvar shadow-ui-theme 'shadow-one
  "The color theme currently in use.")

(defvar shadow-ui-font
  (font-spec :family "Fira Mono" :size 12)
  "The font currently in use.")

(defvar shadow-ui-variable-pitch-font
  (font-spec :family "Fira Sans" :size 12)
  "The font currently in use.")

(defun core-ui--console()
	(message "%s" shadow-ui-fringe-size)
	)

(setq-default
  mode-line-default-help-echo nil ; don't say anything on mode-line mouseover
  indicate-buffer-boundaries nil  ; don't show where buffer starts/ends
  indicate-empty-lines nil        ; don't show empty lines
  fringes-outside-margins t       ; switches order of fringe and margin
  ;; Keep cursors and highlights in current window only
  cursor-in-non-selected-windows nil
  highlight-nonselected-windows nil
  ;; Disable bidirectional text support for slight performance bonus
  bidi-display-reordering nil
  ;; Remove continuation arrow on right fringe
  fringe-indicator-alist (delq (assq 'continuation fringe-indicator-alist)
  fringe-indicator-alist)

  blink-matching-paren nil ; don't blink--too distracting
  show-paren-delay 0.075
  show-paren-highlight-openparen t
  show-paren-when-point-inside-paren t
  uniquify-buffer-name-style nil
  visible-bell nil
  visible-cursor nil
  x-stretch-cursor t
  use-dialog-box nil             ; always avoid GUI
  redisplay-dont-pause t         ; don't pause display on input
  split-width-threshold nil      ; favor horizontal splits
  show-help-function nil         ; hide :help-echo text
  jit-lock-defer-time nil
  jit-lock-stealth-nice 0.1
  jit-lock-stealth-time 0.2
  jit-lock-stealth-verbose nil
  ;; Minibuffer resizing
  resize-mini-windows 'grow-only
  max-mini-window-height 0.3
  image-animate-loop t
  ;; Ask for confirmation on exit only if there are real buffers left
  confirm-kill-emacs
  ;; (lambda (_)
  ;;   (if (ignore-errors (shadow/get-real-buffers))
  ;;     (y-or-n-p "››› Quit?")
  ;;     t))
  )


;; A subtle bell: flash the mode-line
;; TODO More flexible colors (only suits dark themes)
(defvar shadow--modeline-bg nil)


(setq ring-bell-function
  (lambda ()
    (unless shadow--modeline-bg
      (setq shadow--modeline-bg (face-attribute 'mode-line :background)))
    (set-face-attribute 'mode-line nil :background "#54252C")
    (run-with-timer
      0.1 nil
      (lambda () (set-face-attribute 'mode-line nil :background shadow--modeline-bg)))))


;; y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)


(defvar-local doom--mode-line nil)


;;;###autoload
(define-minor-mode doom-hide-mode-line-mode
  "Minor mode to hide the mode-line in the current buffer."
  :init-value nil
  :global nil
  (if doom-hide-mode-line-mode
    (setq doom--mode-line mode-line-format
      mode-line-format doom-hide-mode-line-format)
    (setq mode-line-format doom--mode-line
      doom--mode-line doom-hide-mode-line-format)))


;;;###autoload
(defvar doom-hide-mode-line-format nil
  "Format to use when `doom-hide-mode-line-mode' replaces the modeline")


;; (add-hook (help-mode
;;             compilation-mode
;;             messages-buffer-mode
;;             completion-list-mode
;;             )
;;   'doom-hide-mode-line-mode)


;; Eldoc is enabled globally on Emacs 25. No thank you, I'll do it myself.
(when (bound-and-true-p global-eldoc-mode)
  (global-eldoc-mode -1))

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; no menu bar
;; (if (fboundp 'menu-bar-mode)
;;   (menu-bar-mode -1))

(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

(let ((no-border '(internal-border-width . 0)))
  (add-to-list 'default-frame-alist no-border)
  (add-to-list 'initial-frame-alist no-border))

(when (display-graphic-p)
  ;; standardize fringe width
  (push (cons 'left-fringe  shadow-ui-fringe-size) default-frame-alist)
  (push (cons 'right-fringe shadow-ui-fringe-size) default-frame-alist)
  ;; no fringe in the minibuffer
  ;; (add-hook! (emacs-startup minibuffer-setup)
  ;;   (set-window-fringes (minibuffer-window) 0 0 nil))
  )






(provide 'core-ui)
