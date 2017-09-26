;; Packages
;;-->repositories

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;;-->ensure 'use-package' is loaded

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;-->packages to load

(use-package whitespace
  :bind (("C-c T w" . whitespace-mode))
  :init
  (dolist (hook '(prog-mode-hook text-mode-hooki
				 conf-mode-hook))
    (add-hook hook #'whitespace-mode))
  :config (setq whitespace-line-column nil)
  :diminish whitespace-mode)

(use-package linum-relative
  :bind (("C-c T l" . linum-relative-mode))
  :init
  (dolist (hook '(prog-mode-hook text-mode-hooki
				 conf-mode-hook))
    (add-hook hook #'linum-relative-mode))
  :config (setq linum-relative-format "%3s  "))

(use-package highlight-indent-guides
  :bind (("C-c T h" . highlight-indent-guides-mode))
  :init
  (dolist (hook '(prog-mode-hook conf-mode-hook))
    (add-hook hook #'highlight-indent-guides-mode))
  :config
  (setq highlight-indent-guides-method 'column)
  (setq highlight-indent-guides-auto-enabled nil)
  (set-face-background 'highlight-indent-guides-odd-face "color-238")
  (set-face-background 'highlight-indent-guides-even-face "color-236"))

;; Editor
(menu-bar-mode -1)
