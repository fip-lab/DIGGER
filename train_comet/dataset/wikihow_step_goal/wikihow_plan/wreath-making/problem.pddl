(define (problem make-wreath)
  (:domain wreath-making)
  (:objects
    hanger-1 - hanger
    pliers-1 - pliers
    paper1 - paper_square
    paper2 - paper_square
    paper3 - paper_square
    wreath-1 - wreath
    table-1 - table
  )

  (:init
    ;; 初始状态
    (shape-straight hanger-1)                ; 挂钩形状为直线
  )

  (:goal
    ;; 目标状态
    (and
      (completed wreath-1)
    )
  )
)
