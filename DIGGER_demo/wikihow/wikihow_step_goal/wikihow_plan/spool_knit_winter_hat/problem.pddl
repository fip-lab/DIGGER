(define (problem make_winter_hat)
  (:domain spool_knit_winter_hat)

  (:objects
    web - webbing
    finished_hat - hat
    yarn_piece - yarn
    end_points - ends
  )

  (:init
    ;;
    (in_line web)
    (shape_straight web)
    (width_wider web)

    (has_weight_lighter finished_hat)

    (shape_straight_yarn yarn_piece)

    (unjoined end_points)
  )

  (:goal
    (and
      ;;         ，
      (knitted_together web)
      (shape_rectangular web)
      (width_narrower web)

      ;;
      (has_weight_heavier finished_hat)

      ;;
      (shape_twisted_and_folded yarn_piece)

      ;;
      (joined end_points)
    )
  )
)
