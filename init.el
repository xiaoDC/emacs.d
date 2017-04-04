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
	(load (concat user-emacs-directory "core/core.el"))
  )
