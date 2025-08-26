(define (domain hiking-gear-cleaning)
  (:requirements :strips :typing)
  (:types
    entity
    polar_fleece - entity
    clothing - entity
    washing_machine - entity
    instructions - entity
  )
  
  (:predicates
    (knowledge ?instructions - instructions)
    (cleanness ?entity - entity)
    (fullness ?washing_machine - washing_machine)
    (electric_conductivity ?washing_machine - washing_machine)
    (location ?entity - entity)
  )

  (:action read_instructions
    :parameters (?instructions - instructions)
    :precondition (not (knowledge ?instructions))
    :effect (knowledge ?instructions)
  )

  (:action wash_clothing
    :parameters (?clothing - clothing ?washing_machine - washing_machine)
    :precondition (cleanness ?clothing)
    :effect (not (cleanness ?clothing))
  )

  (:action clean_polar_fleece
    :parameters (?polar_fleece - polar_fleece ?washing_machine - washing_machine)
    :precondition (not (cleanness ?polar_fleece))
    :effect (cleanness ?polar_fleece)
  )
)