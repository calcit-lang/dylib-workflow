
{}
  :configs $ {} (:reload-fn |lib.test/reload!) (:port 6001) (:version |0.0.3)
    :modules $ []
    :init-fn |lib.test/main!
  :ir $ {} (:package |lib)
    :files $ {}
      |lib.core $ {}
        :defs $ {}
          |path-exists? $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1630219258753) (:by |u0)
              |j $ {} (:text |path-exists?) (:type :leaf) (:at 1630219258753) (:by |u0)
              |r $ {}
                :data $ {}
                  |T $ {} (:text |name) (:type :leaf) (:at 1630219268038) (:by |u0)
                :type :expr
                :at 1630219268038
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |&call-dylib-edn) (:type :leaf) (:at 1633253263271) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |str) (:type :leaf) (:at 1630219268038) (:by |u0)
                      |j $ {}
                        :data $ {}
                          |D $ {} (:text |or-current-path) (:type :leaf) (:at 1630245627140) (:by |u0)
                          |T $ {} (:text |calcit-dirname) (:type :leaf) (:at 1630219268038) (:by |u0)
                        :type :expr
                        :at 1630245626564
                        :by |u0
                      |r $ {} (:text "|\"/dylibs/libcalcit_std") (:type :leaf) (:at 1630231388580) (:by |u0)
                      |v $ {}
                        :data $ {}
                          |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1630231396884) (:by |u0)
                        :type :expr
                        :at 1630231389815
                        :by |u0
                    :type :expr
                    :at 1630219268038
                    :by |u0
                  |r $ {} (:text "|\"path_exists") (:type :leaf) (:at 1630219282714) (:by |u0)
                  |v $ {} (:text |name) (:type :leaf) (:at 1630219268038) (:by |u0)
                :type :expr
                :at 1630219268038
                :by |u0
            :type :expr
            :at 1630219258753
            :by |u0
        :proc $ {}
          :data $ {}
          :type :expr
          :at 1630171366222
          :by |u0
        :configs $ {}
        :ns $ {}
          :data $ {}
            |T $ {} (:text |ns) (:type :leaf) (:at 1630171366222) (:by |u0)
            |j $ {} (:text |lib.core) (:type :leaf) (:at 1630171366222) (:by |u0)
            |r $ {}
              :data $ {}
                |T $ {} (:text |:require) (:type :leaf) (:at 1630175119637) (:by |u0)
                |j $ {}
                  :data $ {}
                    |T $ {} (:text |lib.$meta) (:type :leaf) (:at 1634703660055) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1630175127717) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |calcit-dirname) (:type :leaf) (:at 1630175130627) (:by |u0)
                      :type :expr
                      :at 1630175128076
                      :by |u0
                  :type :expr
                  :at 1630175120856
                  :by |u0
                |r $ {}
                  :data $ {}
                    |T $ {} (:text |lib.util) (:type :leaf) (:at 1634703662332) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1633181140100) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1633181140100) (:by |u0)
                        |j $ {} (:text |or-current-path) (:type :leaf) (:at 1633181140100) (:by |u0)
                      :type :expr
                      :at 1633181140100
                      :by |u0
                  :type :expr
                  :at 1633181140100
                  :by |u0
              :type :expr
              :at 1630175118985
              :by |u0
          :type :expr
          :at 1630171366222
          :by |u0
      |lib.test $ {}
        :defs $ {}
          |run-tests $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1633150011172) (:by |u0)
              |j $ {} (:text |run-tests) (:type :leaf) (:at 1633150008092) (:by |u0)
              |r $ {}
                :data $ {}
                :type :expr
                :at 1633150008092
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:type :leaf) (:by |u0) (:at 1634703837934) (:text |println)
                  |j $ {} (:text "|\"%%%% test for lib") (:type :leaf) (:at 1634703847178) (:by |u0)
                :type :expr
                :at 1634703837934
                :by |u0
              |x $ {} (:type :expr) (:by |u0) (:at 1634703837934)
                :data $ {}
                  |T $ {} (:type :leaf) (:by |u0) (:at 1634703837934) (:text |println)
                  |j $ {} (:type :leaf) (:by |u0) (:at 1634703837934) (:text |calcit-filename)
                  |r $ {} (:type :leaf) (:by |u0) (:at 1634703837934) (:text |calcit-dirname)
              |y $ {} (:type :expr) (:by |u0) (:at 1634703837934)
                :data $ {}
                  |T $ {} (:type :leaf) (:by |u0) (:at 1634703837934) (:text |println)
                  |j $ {} (:type :expr) (:by |u0) (:at 1634703837934)
                    :data $ {}
                      |T $ {} (:type :leaf) (:by |u0) (:at 1634703837934) (:text |path-exists?)
                      |j $ {} (:type :leaf) (:by |u0) (:at 1634703837934) (:text "|\"README.md")
                  |r $ {} (:type :expr) (:by |u0) (:at 1634703837934)
                    :data $ {}
                      |T $ {} (:type :leaf) (:by |u0) (:at 1634703837934) (:text |path-exists?)
                      |j $ {} (:type :leaf) (:by |u0) (:at 1634703837934) (:text "|\"build.js")
            :type :expr
            :at 1633150008092
            :by |u0
          |main! $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1633149996242) (:by |u0)
              |j $ {} (:text |main!) (:type :leaf) (:at 1633149996242) (:by |u0)
              |r $ {}
                :data $ {}
                :type :expr
                :at 1633149996242
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |run-tests) (:type :leaf) (:at 1633150004371) (:by |u0)
                :type :expr
                :at 1633150002066
                :by |u0
            :type :expr
            :at 1633149996242
            :by |u0
          |reload! $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1633149998862) (:by |u0)
              |j $ {} (:text |reload!) (:type :leaf) (:at 1633149998862) (:by |u0)
              |r $ {}
                :data $ {}
                :type :expr
                :at 1633149998862
                :by |u0
            :type :expr
            :at 1633149998862
            :by |u0
        :proc $ {}
          :data $ {}
          :type :expr
          :at 1633149625774
          :by |u0
        :configs $ {}
        :ns $ {}
          :data $ {}
            |T $ {} (:text |ns) (:type :leaf) (:at 1633149625774) (:by |u0)
            |j $ {} (:text |lib.test) (:type :leaf) (:at 1633149625774) (:by |u0)
            |r $ {}
              :data $ {}
                |T $ {} (:text |:require) (:type :leaf) (:at 1633149975596) (:by |u0)
                |j $ {}
                  :data $ {}
                    |T $ {} (:text |lib.core) (:type :leaf) (:at 1634703858564) (:by |u0)
                    |j $ {} (:text |:refer) (:type :leaf) (:at 1634703859915) (:by |u0)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:text |path-exists?) (:type :leaf) (:at 1634703860422) (:by |u0)
                      :type :expr
                      :at 1634703860100
                      :by |u0
                  :type :expr
                  :at 1634703855566
                  :by |u0
                |r $ {}
                  :data $ {}
                    |T $ {} (:type :leaf) (:by |u0) (:at 1634703941759) (:text |lib.$meta)
                    |j $ {} (:type :leaf) (:by |u0) (:at 1634703941759) (:text |:refer)
                    |r $ {}
                      :data $ {}
                        |T $ {} (:type :leaf) (:by |u0) (:at 1634703941759) (:text |calcit-dirname)
                        |j $ {} (:text |calcit-filename) (:type :leaf) (:at 1634703953240) (:by |u0)
                      :type :expr
                      :at 1634703941759
                      :by |u0
                  :type :expr
                  :at 1634703941759
                  :by |u0
              :type :expr
              :at 1633149974572
              :by |u0
          :type :expr
          :at 1633149625774
          :by |u0
      |lib.util $ {}
        :defs $ {}
          |get-dylib-ext $ {}
            :data $ {}
              |T $ {} (:text |defmacro) (:type :leaf) (:at 1630231418304) (:by |u0)
              |j $ {} (:text |get-dylib-ext) (:type :leaf) (:at 1633181058353) (:by |u0)
              |r $ {}
                :data $ {}
                :type :expr
                :at 1630231398718
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |case-default) (:type :leaf) (:at 1630231423910) (:by |u0)
                  |b $ {}
                    :data $ {}
                      |T $ {} (:text |&get-os) (:type :leaf) (:at 1630231433951) (:by |u0)
                    :type :expr
                    :at 1630231429893
                    :by |u0
                  |j $ {} (:text "|\".so") (:type :leaf) (:at 1630231427453) (:by |u0)
                  |r $ {}
                    :data $ {}
                      |T $ {} (:text |:macos) (:type :leaf) (:at 1630231439152) (:by |u0)
                      |j $ {} (:text "|\".dylib") (:type :leaf) (:at 1630231447585) (:by |u0)
                    :type :expr
                    :at 1630231437150
                    :by |u0
                  |v $ {}
                    :data $ {}
                      |T $ {} (:text |:windows) (:type :leaf) (:at 1630231449901) (:by |u0)
                      |j $ {} (:text "|\".dll") (:type :leaf) (:at 1630231461388) (:by |u0)
                    :type :expr
                    :at 1630231448478
                    :by |u0
                :type :expr
                :at 1630231403270
                :by |u0
            :type :expr
            :at 1630231398718
            :by |u0
          |or-current-path $ {}
            :data $ {}
              |T $ {} (:text |defn) (:type :leaf) (:at 1630245583936) (:by |u0)
              |j $ {} (:text |or-current-path) (:type :leaf) (:at 1633181131099) (:by |u0)
              |r $ {}
                :data $ {}
                  |T $ {} (:text |p) (:type :leaf) (:at 1630245585364) (:by |u0)
                :type :expr
                :at 1630245582276
                :by |u0
              |v $ {}
                :data $ {}
                  |T $ {} (:text |if) (:type :leaf) (:at 1630245586336) (:by |u0)
                  |j $ {}
                    :data $ {}
                      |T $ {} (:text |blank?) (:type :leaf) (:at 1630245614560) (:by |u0)
                      |j $ {} (:text |p) (:type :leaf) (:at 1630245615061) (:by |u0)
                    :type :expr
                    :at 1630245586894
                    :by |u0
                  |r $ {} (:text "|\".") (:type :leaf) (:at 1630245616843) (:by |u0)
                  |v $ {} (:text |p) (:type :leaf) (:at 1630245618366) (:by |u0)
                :type :expr
                :at 1630245585942
                :by |u0
            :type :expr
            :at 1630245582276
            :by |u0
        :proc $ {}
          :data $ {}
          :type :expr
          :at 1633181044360
          :by |u0
        :configs $ {}
        :ns $ {}
          :data $ {}
            |T $ {} (:text |ns) (:type :leaf) (:at 1633181044360) (:by |u0)
            |j $ {} (:text |lib.util) (:type :leaf) (:at 1633181044360) (:by |u0)
          :type :expr
          :at 1633181044360
          :by |u0
  :users $ {}
    |u0 $ {} (:avatar nil) (:name |chen) (:nickname |chen) (:id |u0) (:theme :star-trail) (:password |d41d8cd98f00b204e9800998ecf8427e)
