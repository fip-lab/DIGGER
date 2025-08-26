(define (domain make_chocolate_hearts)
  (:requirements :strips :typing)
  (:types
    entity
  )
  (:predicates
    (at-cost ?e - entity ?state)
    (at-texture ?e - entity ?state)
    (at-temperature ?e - entity ?state)
    (at-location ?e - entity ?state)
    (at-hardness ?e - entity ?state)
    (at-ease-of-release ?e - entity ?state)
    (at-container ?e - entity ?state)
    (at-fullness ?e - entity ?state)
    (at-cleanness ?e - entity ?state)
    (at-power ?e - entity ?state)
    (at-weight ?e - entity ?state)
  )
  (:action assemble-ingredients
    :parameters (?chocolate - entity ?ingredients - entity)
    :precondition (and
      (at-cost ?chocolate in-store)
      (at-location ?ingredients in-cabinet)
    )
    :effect (and
      (at-cost ?chocolate purchased-for-use)
      (at-location ?ingredients on-countertop)
    )
  )
  (:action melt-chocolate
    :parameters (?chocolate - entity ?microwave - entity ?spoon - entity)
    :precondition (and
      (at-texture ?chocolate solid)
      (at-temperature ?chocolate colder)
      (at-location ?chocolate packaged)
      (at-power ?microwave off)
      (at-cleanness ?spoon clean)
    )
    :effect (and
      (at-texture ?chocolate liquid)
      (at-temperature ?chocolate warmer)
      (at-location ?chocolate out-of-package)
      (at-power ?microwave on)
      (at-cleanness ?spoon dirty)
    )
  )
  (:action pour-into-molds
    :parameters (?chocolate - entity ?mold - entity)
    :precondition (and
      (at-texture ?chocolate liquid)
      (at-fullness ?mold empty)
    )
    :effect (and
      (at-texture ?chocolate in-molds)
      (at-fullness ?mold full)
    )
  )
  (:action freeze-chocolate
    :parameters (?chocolate - entity ?mold - entity)
    :precondition (and
      (at-texture ?chocolate liquid)
    )
    :effect (and
      (at-texture ?chocolate frozen)
      (at-hardness ?chocolate solid)
      (at-temperature ?chocolate colder)
      (at-ease-of-release ?chocolate easy-to-release-from-molds)
      (at-fullness ?mold full)
      (at-weight ?mold heavier)
    )
  )
  (:action release-from-molds
    :parameters (?chocolate - entity ?mold - entity)
    :precondition (and
      (at-texture ?chocolate frozen)
      (at-ease-of-release ?chocolate easy-to-release-from-molds)
    )
    :effect (and
      (at-texture ?chocolate on-plate)
      (at-fullness ?mold empty)
      (at-weight ?mold lighter)
    )
  )
  (:action box-chocolates
    :parameters (?chocolate - entity)
    :precondition (and
      (at-texture ?chocolate on-plate)
    )
    :effect (and
      (at-texture ?chocolate in-box)
    )
  )
)