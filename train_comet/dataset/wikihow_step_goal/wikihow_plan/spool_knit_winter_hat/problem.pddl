(define (problem make_winter_hat)
  (:domain spool_knit_winter_hat)

  (:objects
    web - webbing
    finished_hat - hat
    yarn_piece - yarn
    end_points - ends
  )

  (:init
    ;; 初始状态
    (in_line web)
    (shape_straight web)
    (width_wider web)

    (has_weight_lighter finished_hat)

    (shape_straight_yarn yarn_piece)

    (unjoined end_points)
  )

  (:goal
    (and
      ;; 网已编织并成矩形，宽度变窄
      (knitted_together web)
      (shape_rectangular web)
      (width_narrower web)

      ;; 帽子的重量增加
      (has_weight_heavier finished_hat)

      ;; 纱线已扭曲折叠
      (shape_twisted_and_folded yarn_piece)

      ;; 末端已连接
      (joined end_points)
    )
  )
)
