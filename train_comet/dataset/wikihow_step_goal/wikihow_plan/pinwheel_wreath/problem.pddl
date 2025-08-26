(define (problem make-pinwheel-wreath)
  (:domain pinwheel-wreath)
  (:objects
    p1 - paper
    w1 - wreath
    pw1  - pinwheel
    t1 - twine
  )

  (:init
    ;; 初始状态：所有谓词为假
    (not (selected p1))
    (not (knowledge p1))
    (has-shape p1)
    (not (made pw1))
    (not (attached pw1))
    (not (base-chosen w1))
    (not (twine-attached t1))
    (not (twine-located t1))
  )

  (:goal
    (and
      ;; 目标状态：纸张被选择并具有知识和形状
      (selected p1)
      (knowledge p1)
      (has-shape p1)

      ;; 制作并附加所有旋转叶片
      (made pw1)
      (attached pw1)

      ;; 花环基座被选择
      (base-chosen w1)

      ;; 麻绳/丝带被附加并位于基座上
      (twine-attached t1)
      (twine-located t1)
    )
  )
)
