
{} (:about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --full` first. Manual edits must follow format and schema conventions, then run `calcit edit format`.") (:package |lib)
  :entries $ {}
    :default $ {} (:description |) (:init-fn 'lib.test/main!) (:mode :native) (:reload-fn 'lib.test/reload!)
      :feature-policy $ {}
      :modules $ []
      :type-slots $ {}
  :files $ {}
    |lib.core $ %{} 'FileEntry
      :defs $ {}
        |path-exists? $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn path-exists? (name)
              &call-dylib-edn (get-dylib-path |/dylibs/libcalcit_std) |path_exists name
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns lib.core $ :require
            lib.$meta :refer $ calcit-dirname
            lib.util :refer $ get-dylib-path
    |lib.test $ %{} 'FileEntry
      :defs $ {}
        |main! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn main! () $ run-tests
          :examples $ []
          :schema $ :: 'Dynamic
        |reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn reload! $
          :examples $ []
          :schema $ :: 'Dynamic
        |run-tests $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn run-tests () (println "|%%%% test for lib") (println calcit-filename calcit-dirname)
              println (path-exists? |README.md) (path-exists? |build.js)
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns lib.test $ :require
            lib.core :refer $ path-exists?
            lib.$meta :refer $ calcit-dirname calcit-filename
    |lib.util $ %{} 'FileEntry
      :defs $ {}
        |get-dylib-ext $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defmacro get-dylib-ext () $ case-default (&get-os) |.so (:macos |.dylib) (:windows |.dll)
          :examples $ []
          :schema $ :: 'Dynamic
        |get-dylib-path $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn get-dylib-path (p)
              str (or-current-path calcit-dirname) p $ get-dylib-ext
          :examples $ []
          :schema $ :: 'Dynamic
        |or-current-path $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn or-current-path (p)
              if (blank? p) |. p
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns lib.util $ :require
            lib.$meta :refer $ calcit-dirname calcit-filename
