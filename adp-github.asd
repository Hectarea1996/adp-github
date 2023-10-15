
(defsystem "adp-github"
  :author "Héctor Galbis Sanchis"
  :description "ADP extension to generate github markdown files."
  :license "MIT"
  :depends-on ("alexandria" "closer-mop" "adp")
  :components ((:file "package")
               (:module "src"
                :components ((:file "tags")
                             (:file "adp-github" :depends-on ("tags"))
                             (:file "elements" :depends-on ("tags"))
                             (:file "pprint-dispatch")
                             (:file "printer" :depends-on ("pprint-dispatch" "adp-github" "elements" "tags"))
                             (:file "functions" :depends-on ("adp-github" "elements" "tags"))))))
