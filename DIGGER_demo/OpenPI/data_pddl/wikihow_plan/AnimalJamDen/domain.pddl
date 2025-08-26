(define (domain AnimalJamDen)
  (:requirements :strips :typing)
  (:types entity attribute)
  
  (:predicates 
    (unacquired ?entity)
    (acquired ?entity)
    (in-store ?entity)
    (in-home ?entity)
    (unmade ?entity)
    (created ?entity)
    (safe ?entity)
  )
  
  (:action acquire-gems
    :parameters (?entity - entity)
    :precondition (unacquired ?entity)
    :effect (and (acquired ?entity) (not (unacquired ?entity)))
  )

  (:action bring-stuff-home
    :parameters (?entity - entity)
    :precondition (in-store ?entity)
    :effect (and (in-home ?entity) (not (in-store ?entity)))
  )

  (:action get-screens
    :parameters (?entity - entity)
    :precondition (in-store ?entity)
    :effect (and (in-home ?entity) (not (in-store ?entity)))
  )

  (:action create-rooms
    :parameters (?entity - entity)
    :precondition (unmade ?entity)
    :effect (and (created ?entity) (not (unmade ?entity)))
  )

  (:action make-outside-area
    :parameters (?entity - entity)
    :precondition (unmade ?entity)
    :effect (and (created ?entity) (not (unmade ?entity)))
  )

  (:action keep-family-safe
    :parameters (?entity - entity)
    :precondition ()
    :effect (safe ?entity)
  )
)