
{} (:package |lib)
  :configs $ {} (:init-fn |lib.test/main!) (:reload-fn |lib.test/reload!) (:version |0.0.1)
    :modules $ []
  :entries $ {}
  :files $ {}
    |lib.core $ %{} :FileEntry
      :defs $ {}
        |path-exists? $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn path-exists? (name)
              &call-dylib-edn (get-dylib-path "\"/dylibs/libcalcit_std") "\"path_exists" name
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns lib.core $ :require
            lib.$meta :refer $ calcit-dirname
            lib.util :refer $ get-dylib-path
    |lib.test $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn main! () $ run-tests
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn reload! $
        |run-tests $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn run-tests () (println "\"%%%% test for lib") (println calcit-filename calcit-dirname)
              println (path-exists? "\"README.md") (path-exists? "\"build.js")
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns lib.test $ :require
            lib.core :refer $ path-exists?
            lib.$meta :refer $ calcit-dirname calcit-filename
    |lib.util $ %{} :FileEntry
      :defs $ {}
        |get-dylib-ext $ %{} :CodeEntry (:doc |)
          :code $ quote
            defmacro get-dylib-ext () $ case-default (&get-os) "\".so" (:macos "\".dylib") (:windows "\".dll")
        |get-dylib-path $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn get-dylib-path (p)
              str (or-current-path calcit-dirname) p $ get-dylib-ext
        |or-current-path $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn or-current-path (p)
              if (blank? p) "\"." p
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns lib.util $ :require
            lib.$meta :refer $ calcit-dirname calcit-filename
