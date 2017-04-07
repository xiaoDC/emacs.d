;; 初始化evil配置
(defun shadow--init-evil ()
  "初始化evil包"
  (use-package evil
    :ensure t
    :commands (evil-mode evil-define-key)
    :config
    (evil-mode 1)
    (shadow--init-evil-leader)
    (shadow--init-evil-intent-textobject)
    ))

(defun shadow--init-evil-leader ()
  "初始化evil leader"
  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    ))

(defun shadow--init-evil-intent-textobject ()
  "初始化evil intent和surround"
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode)))

(defun shadow-init-evil-keybindings ()
  "初始化evil的键位"
  ;; evil-surround
  ;; 交换evil-surround的大小写s
  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-surround-region)
  (evil-define-key 'visual evil-surround-mode-map "S" 'evil-substitute)
  ;; evil-leader
  ;; (evil-leader/set-key "SPC")
  )

(defun shadow--init-evil-packages ()
  (shadow--init-evil))

(defun shadow--setup-evil ()
  "设置evil的环境"
  (shadow--init-evil-packages)
  (shadow-init-evil-keybindings)
  )

;;;###autoload
(shadow--setup-evil)
;;;###autoload
(evil-mode 1)

(provide 'init-evil)
