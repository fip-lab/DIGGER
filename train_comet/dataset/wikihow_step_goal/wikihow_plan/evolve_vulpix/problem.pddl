(define (problem evolve_vulpix_problem)
  (:domain evolve_vulpix)

  (:objects
    stone - stone
    vulpix - vulpix
    bag - bag
  )

  (:init
    (not (has_vulpix vulpix))
    (not (found_fire_stone stone))
    (not (selected_stone stone))
    (not (selected_bag bag))
  )

  (:goal
    (and (vulpix_evolved vulpix))
  )
)