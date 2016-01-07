(in-package :cl-user)
(defpackage kebab-test
  (:use :cl
        :kebab
        :prove))
(in-package :kebab-test)

;; NOTE: To run this test file, execute `(asdf:test-system :kebab)' in your Lisp.

(plan nil)

(subtest "Test camelCase"
         (subtest "Test on string"
                  (is (to-camel-case "PascalCase") "pascalCase")
                  (is (to-camel-case "camelCase") "camelCase")
                  (is (to-camel-case "snake_case") "snakeCase")
                  (is (to-camel-case "kebab-case") "kebabCase")
                  (is (to-camel-case "lisp-case") "lispCase")
                  (is (to-camel-case "com plexSt_-ring") "comPlexStRing"))
         (subtest "Test on keyword"
                  (is (to-camel-case :|PascalCase|) :|pascalCase|)
                  (is (to-camel-case :|camelCase|) :|camelCase|)
                  (is (to-camel-case :|snake_case|) :|snakeCase|)
                  (is (to-camel-case :|kebab-case|) :|kebabCase|)
                  (is (to-camel-case :|lisp-case|) :|lispCase|)
                  (is (to-camel-case :|com plexSt_-ring|) :|comPlexStRing|))
         (subtest "Test on symbol"
                  (is (to-camel-case '|PascalCase|) '|pascalCase|)
                  (is (to-camel-case '|camelCase|) '|camelCase|)
                  (is (to-camel-case '|snake_case|) '|snakeCase|)
                  (is (to-camel-case '|kebab-case|) '|kebabCase|)
                  (is (to-camel-case '|lisp-case|) '|lispCase|)
                  (is (to-camel-case '|com plexSt_-ring|) '|comPlexStRing|)))

(subtest "Test PascalCase"
         (subtest "Test on string"
                  (is (to-pascal-case "PascalCase") "PascalCase")
                  (is (to-pascal-case "camelCase") "CamelCase")
                  (is (to-pascal-case "snake_case") "SnakeCase")
                  (is (to-pascal-case "kebab-case") "KebabCase")
                  (is (to-pascal-case "lisp-case") "LispCase")
                  (is (to-pascal-case "com plexSt_-ring") "ComPlexStRing"))
         (subtest "Test on keyword"
                  (is (to-pascal-case :|PascalCase|) :|PascalCase|)
                  (is (to-pascal-case :|camelCase|) :|CamelCase|)
                  (is (to-pascal-case :|snake_case|) :|SnakeCase|)
                  (is (to-pascal-case :|kebab-case|) :|KebabCase|)
                  (is (to-pascal-case :|lisp-case|) :|LispCase|)
                  (is (to-pascal-case :|com plexSt_-ring|) :|ComPlexStRing|))
         (subtest "Test on symbol"
                  (is (to-pascal-case '|PascalCase|) '|PascalCase|)
                  (is (to-pascal-case '|camelCase|) '|CamelCase|)
                  (is (to-pascal-case '|snake_case|) '|SnakeCase|)
                  (is (to-pascal-case '|kebab-case|) '|KebabCase|)
                  (is (to-pascal-case '|lisp-case|) '|LispCase|)
                  (is (to-pascal-case '|com plexSt_-ring|) '|ComPlexStRing|)))

(subtest "Test snake_case"
         (subtest "Test on string"
                  (is (to-snake-case "PascalCase") "pascal_case")
                  (is (to-snake-case "camelCase") "camel_case")
                  (is (to-snake-case "snake_case") "snake_case")
                  (is (to-snake-case "kebab-case") "kebab_case")
                  (is (to-snake-case "lisp-case") "lisp_case")
                  (is (to-snake-case "com plexSt_-ring") "com_plex_st_ring"))
         (subtest "Test on keyword"
                  (is (to-snake-case :|PascalCase|) :|pascal_case|)
                  (is (to-snake-case :|camelCase|) :|camel_case|)
                  (is (to-snake-case :|snake_case|) :|snake_case|)
                  (is (to-snake-case :|kebab-case|) :|kebab_case|)
                  (is (to-snake-case :|lisp-case|) :|lisp_case|)
                  (is (to-snake-case :|com plexSt_-ring|) :|com_plex_st_ring|))
         (subtest "Test on symbol"
                  (is (to-snake-case '|PascalCase|) '|pascal_case|)
                  (is (to-snake-case '|camelCase|) '|camel_case|)
                  (is (to-snake-case '|snake_case|) '|snake_case|)
                  (is (to-snake-case '|kebab-case|) '|kebab_case|)
                  (is (to-snake-case '|lisp-case|) '|lisp_case|)
                  (is (to-snake-case '|com plexSt_-ring|) '|com_plex_st_ring|)))

(subtest "Test kebab-case"
         (subtest "Test on string"
                  (is (to-kebab-case "PascalCase") "pascal-case")
                  (is (to-kebab-case "camelCase") "camel-case")
                  (is (to-kebab-case "snake_case") "snake-case")
                  (is (to-kebab-case "kebab-case") "kebab-case")
                  (is (to-kebab-case "lisp-case") "lisp-case")
                  (is (to-kebab-case "com plexSt_-ring") "com-plex-st-ring"))
         (subtest "Test on keyword"
                  (is (to-kebab-case :|PascalCase|) :|pascal-case|)
                  (is (to-kebab-case :|camelCase|) :|camel-case|)
                  (is (to-kebab-case :|snake_case|) :|snake-case|)
                  (is (to-kebab-case :|kebab-case|) :|kebab-case|)
                  (is (to-kebab-case :|lisp-case|) :|lisp-case|)
                  (is (to-kebab-case :|com plexSt_-ring|) :|com-plex-st-ring|))
         (subtest "Test on symbol"
                  (is (to-kebab-case '|PascalCase|) '|pascal-case|)
                  (is (to-kebab-case '|camelCase|) '|camel-case|)
                  (is (to-kebab-case '|snake_case|) '|snake-case|)
                  (is (to-kebab-case '|kebab-case|) '|kebab-case|)
                  (is (to-kebab-case '|lisp-case|) '|lisp-case|)
                  (is (to-kebab-case '|com plexSt_-ring|) '|com-plex-st-ring|)))

(subtest "Test macro-case"
         (subtest "Test on string"
                  (is (to-macro-case "PascalCase") "PASCAL_CASE")
                  (is (to-macro-case "camelCase") "CAMEL_CASE")
                  (is (to-macro-case "snake_case") "SNAKE_CASE")
                  (is (to-macro-case "kebab-case") "KEBAB_CASE")
                  (is (to-macro-case "lisp-case") "LISP_CASE")
                  (is (to-macro-case "com plexSt_-ring") "COM_PLEX_ST_RING"))
         (subtest "Test on keyword"
                  (is (to-macro-case :|PascalCase|) :PASCAL_CASE)
                  (is (to-macro-case :|camelCase|) :CAMEL_CASE)
                  (is (to-macro-case :|snake_case|) :SNAKE_CASE)
                  (is (to-macro-case :|kebab-case|) :KEBAB_CASE)
                  (is (to-macro-case :|lisp-case|) :LISP_CASE)
                  (is (to-macro-case :|com plexSt_-ring|) :COM_PLEX_ST_RING))
         (subtest "Test on symbol"
                  (is (to-macro-case '|PascalCase|) 'PASCAL_CASE)
                  (is (to-macro-case '|camelCase|) 'CAMEL_CASE)
                  (is (to-macro-case '|snake_case|) 'SNAKE_CASE)
                  (is (to-macro-case '|kebab-case|) 'KEBAB_CASE)
                  (is (to-macro-case '|lisp-case|) 'LISP_CASE)
                  (is (to-macro-case '|com plexSt_-ring|) 'COM_PLEX_ST_RING)))

(subtest "Test lisp-case"
         (subtest "Test on string"
                  (is (to-lisp-case "PascalCase") "pascal-case")
                  (is (to-lisp-case "camelCase") "camel-case")
                  (is (to-lisp-case "snake_case") "snake-case")
                  (is (to-lisp-case "kebab-case") "kebab-case")
                  (is (to-lisp-case "lisp-case") "lisp-case")
                  (is (to-lisp-case "com plexSt_-ring") "com-plex-st-ring"))
         (subtest "Test on keyword"
                  (is (to-lisp-case :|PascalCase|) :|pascal-case|)
                  (is (to-lisp-case :|camelCase|) :|camel-case|)
                  (is (to-lisp-case :|snake_case|) :|snake-case|)
                  (is (to-lisp-case :|kebab-case|) :|kebab-case|)
                  (is (to-lisp-case :|lisp-case|) :|lisp-case|)
                  (is (to-lisp-case :|com plexSt_-ring|) :|com-plex-st-ring|))
         (subtest "Test on symbol"
                  (is (to-lisp-case '|PascalCase|) '|pascal-case|)
                  (is (to-lisp-case '|camelCase|) '|camel-case|)
                  (is (to-lisp-case '|snake_case|) '|snake-case|)
                  (is (to-lisp-case '|kebab-case|) '|kebab-case|)
                  (is (to-lisp-case '|lisp-case|) '|lisp-case|)
                  (is (to-lisp-case '|com plexSt_-ring|) '|com-plex-st-ring|)))

(finalize)
