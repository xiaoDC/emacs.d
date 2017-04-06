;; init.el --- Shadowemacs Initialization File
;;
;; Author:
;; URL:
;; Version: 0.0.1
;;
;;
;;
;;
(defconst shadowemacs-version          "0.200.8" "Shadowemacs version.")
(defconst shadowemacs-emacs-min-version   "24.4" "Minimal version of Emacs.")

(if (not (version<= shadowemacs-emacs-min-version emacs-version))
	(error (concat "Your version of Emacs (%s) is too old. "
		"Shadowemacs requires Emacs version %s or above.")
		emacs-version shadowemacs-emacs-min-version)
	;; (load (concat user-emacs-directory "core/core.el"))

  (package-initialize)
  (require 'package)
  ;; (setq package-enable-at-startup nil)
  (add-to-list 'package-archives '("melpa-cn" . "http://elpa.emacs-china.org/melpa/"))
  (add-to-list 'package-archives '("org-cn" . "http://elpa.emacs-china.org/org/"))
  (add-to-list 'package-archives '("gnu-cn" . "http://elpa.emacs-china.org/gnu/"))
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
  (eval-when-compile
    (require 'use-package))

  (add-to-list 'load-path "/Users/fri3nds/myself/emacs.d/core")
  (require 'core)
  )
