(define (domain wreath-making)
  (:requirements :strips :typing)
  (:types
    hanger pliers paper_square wreath table)

  (:predicates
    ;; 状态谓词
    (shape-straight ?h - hanger)                ; 挂钩形状为直线
    (shape-circle ?h - hanger)                 ; 挂钩形状为圆形
    (crumpled ?p - paper_square)               ; 纸张被揉皱
    (threaded ?h - hanger ?p - paper_square)   ; 纸张穿过挂钩
    (squares-pushed-away ?h - hanger)          ; 纸张被推离挂钩两端
    (twisted-ends ?h - hanger)                 ; 挂钩两端被扭结
    (squares-scrunched ?p - paper_square)      ; 纸张被捏紧
    (completed ?w - wreath)                    ; 花环已完成
  )

  ;; 动作1：解开挂钩并塑形为圆形
  (:action untwist-and-shape-hanger
    :parameters (?h - hanger ?p - pliers)
    :precondition (shape-straight ?h)
    :effect (and
              (shape-circle ?h)
              (not (shape-straight ?h))
            )
  )

  ;; 动作2：揉皱纸张并穿过挂钩
  (:action crumple-and-thread-paper
    :parameters (?p - paper_square ?h - hanger)
    :precondition (and
                    (shape-circle ?h)
                    (not (crumpled ?p))
                    (not (threaded ?h ?p))
                  )
    :effect (and
              (crumpled ?p)
              (threaded ?h ?p)
            )
  )

  ;; 动作3：推开纸张并扭结挂钩两端
  (:action push-squares-and-twist-ends
    :parameters (?h - hanger ?p - pliers)
    :precondition (and
                    (shape-circle ?h)
                    (threaded ?h paper1)
                    (threaded ?h paper2)
                    (threaded ?h paper3)
                  )
    :effect (and
              (squares-pushed-away ?h)
              (twisted-ends ?h)
            )
  )

  ;; 动作4：将纸张滑回挂钩并捏紧
  (:action slide-and-scrunch-squares
    :parameters (?p - paper_square ?h - hanger)
    :precondition (and
                    (squares-pushed-away ?h)
                    (threaded ?h ?p)
                    (crumpled ?p)
                  )
    :effect (squares-scrunched ?p)
  )

  ;; 动作5：完成花环
  (:action finish-wreath
    :parameters (?w - wreath ?h - hanger)
    :precondition (and
                    (twisted-ends ?h)
                    (squares-scrunched paper1)
                    (squares-scrunched paper2)
                    (squares-scrunched paper3)
                  )
    :effect (completed ?w)
  )
)
