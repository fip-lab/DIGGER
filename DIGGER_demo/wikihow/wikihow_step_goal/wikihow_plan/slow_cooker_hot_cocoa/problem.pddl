(define (problem make_hot_cocoa)
  (:domain slow_cooker_hot_cocoa)

  (:objects
    mixture - entity
  )

  (:init
    (initial_mixture mixture)
    (in_bowl mixture)
  )

  (:goal
    (cocoa_served mixture)
  )
)