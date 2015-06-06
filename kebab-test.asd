#|
  This file is a part of kebab project.
  Copyright (c) 2015 Masato Sogame (poketo7878@gmail.com)
|#

(in-package :cl-user)
(defpackage kebab-test-asd
  (:use :cl :asdf))
(in-package :kebab-test-asd)

(defsystem kebab-test
  :author "Masato Sogame"
  :license "LLGPL"
  :depends-on (:kebab
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "kebab"))))
  :description "kebab's test asdf-system"
  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
