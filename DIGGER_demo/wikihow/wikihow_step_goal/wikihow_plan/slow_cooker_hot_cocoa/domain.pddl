(define (domain slow_cooker_hot_cocoa)
  (:requirements :strips :typing)

  (:types
    entity
  )

  (:predicates
    (initial_mixture ?e - entity)
    (mixed_mixture ?e - entity)
    (in_bowl ?e - entity)
    (in_slow_cooker ?e - entity)
    (mixture_heated ?e - entity)
    (cocoa_served ?e - entity)
  )

  (:action make_initial_mixture
    :parameters (?e - entity)
    :precondition (initial_mixture ?e)
    :effect (and (mixed_mixture ?e) (not (initial_mixture ?e)))
  )

  (:action add_ingredients_to_slow_cooker
    :parameters (?e - entity)
    :precondition (and (mixed_mixture ?e) (in_bowl ?e))
    :effect (and (in_slow_cooker ?e) (not (in_bowl ?e)))
  )

  (:action heat_mixture
    :parameters (?e - entity)
    :precondition (in_slow_cooker ?e)
    :effect (mixture_heated ?e)
  )

  (:action serve_cocoa
    :parameters (?e - entity)
    :precondition (mixture_heated ?e)
    :effect (cocoa_served ?e)
  )
)