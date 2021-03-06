;; Window-system goodies
(when window-system
  (set-default-font "Inconsolata-14")
  (set-frame-size (car (frame-list)) 142 40) ;; characters wide, lines tall
  (set-frame-position (car (frame-list)) 70 33)) ;; x y

;; TextMate-like keybindings
(textmate-mode)

;; Highlight keywords
(defun highlight-keywords ()
  (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\)" 1 font-lock-warning-face t))))

;; LaTeX (AucTeX) options
(setq TeX-PDF-mode 't
      font-latex-fontify-sectioning 'color
      TeX-source-correlate-method 'synctex)
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (TeX-source-correlate-mode)
            (visual-line-mode)
            (auto-fill-mode -1)
            (highlight-keywords)))

;; Emacs Server
(server-start)
(add-hook 'server-switch-hook 
          (lambda () (local-set-key (kbd "C-x k")
                               '(lambda () (interactive)
                                  (if server-buffer-clients
                                      (server-edit)
                                    (ido-kill-buffer))))))
