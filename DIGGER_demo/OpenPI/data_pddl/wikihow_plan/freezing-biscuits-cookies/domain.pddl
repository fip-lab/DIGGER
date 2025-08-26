(define (domain freezing-biscuits-cookies)
  (:requirements :strips :typing)
  
  (:types 
    item
  )

  (:predicates 
    (in-container ?i - item)
    (airtight-container ?i - item)
    (in-lined-tin ?i - item)
    (separated ?i - item)
    (in-freezer ?i - item)
    (thawed ?i - item)
  )
  
  (:action place-in-container
    :parameters (?i - item)
    :precondition (and (not (in-container ?i)))
    :effect (and (in-container ?i)))

  (:action separate-using-paper
    :parameters (?i - item)
    :precondition (and (in-container ?i) (not (in-lined-tin ?i)))
    :effect (and (in-lined-tin ?i)))

  (:action place-in-freezer
    :parameters (?i - item)
    :precondition (and (in-lined-tin ?i) (not (in-freezer ?i)))
    :effect (and (in-freezer ?i)))

  (:action thaw
    :parameters (?i - item)
    :precondition (in-freezer ?i)
    :effect (and (thawed ?i) (not (in-freezer ?i)))
  )
)