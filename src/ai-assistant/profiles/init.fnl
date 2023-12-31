(local pair-programmer (require :ai-assistant.profiles.pair-programmer))
(local swagger (require :ai-assistant.profiles.swagger))
(local general (require :ai-assistant.profiles.general))
(local translator (require :ai-assistant.profiles.translator))
(local secretary (require :ai-assistant.profiles.secretary))

(fn profile [kind]
  (let [profiles {}]
    (fn [name bufnr]
      (let [p (. profiles bufnr)]
        (if (not p)
          (let [p ((. kind name) bufnr)]
            (tset p :name name)
            (tset profiles bufnr p)
            p)
          p)))))

(fn is-profile [obj]
  (and (= (type obj) :table)
       (= (type obj.init) :function)
       (= (type obj.update) :function)))

{:buffer-related-profiles (profile {: pair-programmer
                                    : swagger})
 :buffer-independent-profiles (profile {: general
                                        : secretary
                                        : translator})
 : is-profile}
