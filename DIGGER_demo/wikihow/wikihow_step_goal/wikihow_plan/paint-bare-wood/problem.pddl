(define (problem paint-bare-wood-problem)
  (:domain paint-bare-wood)

  (:objects
    ;;
    alice - person

    ;;
    paintbrush1 - tool

    ;;
    oil_paint1 - material

    ;;
    barewood1 - object
  )

  (:init
    ;;
    (not (has_paint alice oil_paint1))
    (not (has_tool alice paintbrush1))

    (present barewood1)

    (clean paintbrush1)

    ;;   alice
  )

  (:goal
    (and
      (finished_painting barewood1)
    )
  )
)
