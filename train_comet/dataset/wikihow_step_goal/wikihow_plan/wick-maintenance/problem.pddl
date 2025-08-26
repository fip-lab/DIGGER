(define (problem wick-smoking-prevention)
  (:domain wick-maintenance)
  (:objects
    wick1 - wick
    vinegar1 - vinegar
    lamp1 - lamp
    container1 - container
  )

  (:init
    (in_lamp wick1)
    (not (vinegar_in_container vinegar1))
  )

  (:goal
    (and
      (in_lamp wick1)
      (dry wick1)
      (not (wet wick1))
    )
  )
)
