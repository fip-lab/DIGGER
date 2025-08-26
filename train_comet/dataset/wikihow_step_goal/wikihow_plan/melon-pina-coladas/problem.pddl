(define (problem make-melon-pina-coladas)
  (:domain melon-pina-coladas)
  
  (:objects
    mixture1 - mixture
    pitcher1 - pitcher
    glass1 glass2 - glass
    refrigerator1 - refrigerator
    honeydew1 - honeydew
    kitchen_counter dining_table - object
  )

  (:init
    ;; 初始状态
    (empty pitcher1)
    (in mixture1 kitchen_counter)
    (in pitcher1 kitchen_counter) ; 壶位于厨房台面
    (not (mixed pitcher1))
    (not (chilled pitcher1))
    (not (in_glass mixture1 glass1))
    (not (garnished honeydew1 glass1))
    (not (on_table glass1))
  )

  (:goal
    (and
      ;; 最终目标
      (in_glass mixture1 glass1)
      (garnished honeydew1 glass1)
      (on_table glass1)
      (empty pitcher1)
    )
  )
)
