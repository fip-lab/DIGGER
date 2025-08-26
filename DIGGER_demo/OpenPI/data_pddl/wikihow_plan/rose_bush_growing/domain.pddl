(define (domain rose_bush_growing)
  (:requirements :strips :typing)
  
  (:types entity)

  (:predicates 
    (prepared ?e - entity)
    (cut ?e - entity)
    (moistened ?e - entity)
    (planted ?e - entity)
  )

  (:action prepare_area
    :parameters (?e - entity)
    :precondition (not (prepared ?e))
    :effect (prepared ?e)
  )

  (:action take_cutting
    :parameters (?e - entity)
    :precondition (and (prepared ?e) (not (cut ?e)))
    :effect (cut ?e)
  )

  (:action moisten_clipping
    :parameters (?e - entity)
    :precondition (and (cut ?e) (not (moistened ?e)))
    :effect (moistened ?e)
  )

  (:action plant_cutting
    :parameters (?e - entity)
    :precondition (and (moistened ?e) (not (planted ?e)))
    :effect (planted ?e)
  )
)