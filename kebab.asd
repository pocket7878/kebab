#|
  This file is a part of kebab project.
  Copyright (c) 2015 Masato Sogame (poketo7878@gmail.com)
|#

#|
  Author: Masato Sogame (poketo7878@gmail.com)
|#

(in-package :cl-user)
(defpackage kebab-asd
  (:use :cl :asdf))
(in-package :kebab-asd)

(defsystem kebab
  :version "0.1"
  :author "Masato Sogame"
  :license "LLGPL"
  :depends-on (:cl-ppcre
               :cl-interpol
               :alexandria
               :split-sequence)
  :components ((:module "src"
                :components
                ((:file "kebab"))))
  :description "Common Lisp string,symbol,keyword PascalCase <=> camelCase <=> snake_case <=> kebab-case(lisp-case) converter."
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op kebab-test))))
