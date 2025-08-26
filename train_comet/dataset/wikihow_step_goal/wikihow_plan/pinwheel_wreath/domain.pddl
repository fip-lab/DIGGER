(define (domain pinwheel-wreath)
  (:requirements :strips :typing)
  (:types
    paper wreath pinwheel twine)

  (:predicates
    ;; 纸张相关谓词
    (selected ?p - paper)          ; 纸张已被选择
    (knowledge ?p - paper)         ; 纸张知识已被获取
    (has-shape ?p - paper)         ; 纸张具有所需形状

    ;; 旋转叶片相关谓词
    (made ?pw - pinwheel)          ; 旋转叶片已被制作
    (attached ?pw - pinwheel)      ; 旋转叶片已被附加

    ;; 花环基座相关谓词
    (base-chosen ?w - wreath)      ; 花环基座已被选择

    ;; 麻绳/丝带相关谓词
    (twine-attached ?t - twine)    ; 麻绳/丝带已被附加
    (twine-located ?t - twine)     ; 麻绳/丝带位于花环基座上
  )

  ;; 动作 1: 选择纸张
  (:action select-paper
    :parameters (?p - paper)
    :precondition (and (not (selected ?p)) (not (knowledge ?p)))
    :effect (and (selected ?p) (knowledge ?p))
  )

  ;; 动作 2: 制作旋转叶片
  (:action make-pinwheel
    :parameters (?pw - pinwheel ?p - paper)
    :precondition (and (selected ?p) (has-shape ?p) (not (made ?pw)))
    :effect (made ?pw)
  )

  ;; 动作 3: 选择花环基座
  (:action choose-wreath-base
    :parameters (?w - wreath)
    :precondition (not (base-chosen ?w))
    :effect (base-chosen ?w)
  )

  ;; 动作 4: 附加麻绳/丝带
  (:action attach-twine
    :parameters (?t - twine ?w - wreath)
    :precondition (and (base-chosen ?w) (not (twine-attached ?t)) (not (twine-located ?t)))
    :effect (and (twine-attached ?t) (twine-located ?t))
  )

  ;; 动作 5: 附加旋转叶片到花环基座
  (:action attach-pinwheel
    :parameters (?pw - pinwheel ?w - wreath)
    :precondition (and (made ?pw) (base-chosen ?w) (not (attached ?pw)))
    :effect (attached ?pw)
  )
)
