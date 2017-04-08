(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  :config
  (which-key-setup-side-window-bottom)
  ;; 符号替换
  (add-to-list 'which-key-replacement-alist '(("TAB" . nil) . ("↹" . nil)))
  (add-to-list 'which-key-replacement-alist '(("RET" . nil) . ("⏎" . nil)))
  (add-to-list 'which-key-replacement-alist '(("DEL" . nil) . ("⇤" . nil)))
  (add-to-list 'which-key-replacement-alist '(("SPC" . nil) . ("␣" . nil)))

  (which-key-declare-prefixes "SPC" "shadow root")
  )

(use-package general :ensure t
  :config
  (general-evil-setup t)

  (use-package counsel :ensure t
    :bind*                           ; load counsel when pressed
    (("M-x"     . counsel-M-x)       ; M-x use counsel
     ("C-x C-f" . counsel-find-file) ; C-x C-f use counsel-find-file
     ("C-x C-r" . counsel-recentf)   ; search recently edited files
     ("C-c f"   . counsel-git)       ; search for files in git repo
     ("C-c s"   . counsel-git-grep)  ; search for regexp in git repo
     ("C-c /"   . counsel-ag)        ; search for regexp in git repo using ag
     ("C-c l"   . counsel-locate))   ; search for files or else using locate
    )

  (general-define-key
   :states '(normal motion emacs)
   :prefix "SPC"
   :global-prefix "SPC"
   ;; "SPC" 'cousel-M-x
   "g"  '(:ignore t :which-key "Git")
   "gs" '(magit-status :which-key "git status")

   "f"  '(:ignore t :which-key "File")
   "ff" '(counsel-find-file "^" :which-key "find-file")
   )

  )

(defun shadow--swiper-search (p)
  (interactive "P")
  (let ((current-prefix-arg nil))
    (call-interactively
     (if p #'spacemacs/swiper-region-or-symbol
       #'counsel-grep-or-swiper))))

(use-package ivy :ensure t
  :diminish (ivy-mode . "") ; does not display ivy in the modeline
  :init (ivy-mode 1)        ; enable ivy globally at startup
  :bind (:map ivy-mode-map  ; bind in the ivy buffer
              ("C-'" . ivy-avy)
              ("C-s" . shadow--swiper-search)
              )                         ; C-' to ivy-avy
  :config
  (setq ivy-use-virtual-buffers t)   ; extend searching to bookmarks and …
  (setq ivy-height 20)               ; set height of the ivy window
  (setq ivy-count-format "(%d/%d) ") ; count format, from the ivy help page
  )


(provide 'init-ui)
