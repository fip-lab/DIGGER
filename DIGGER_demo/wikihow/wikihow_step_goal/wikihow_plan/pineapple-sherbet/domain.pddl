(define (domain pineapple-sherbet)
  (:requirements :strips :typing)
  (:types
      food
      ingredient - food
      mixture - food
      sherbet - food
      container
      appliance
      utensil
      location
  )

  (:predicates
      (at ?entity - object ?location - location)
      (in ?entity - food ?container - container)
      (state ?appliance - appliance ?status - status)
      (is-fresh ?ingredient - ingredient)
      (blended ?food - food)
      (frozen ?food - food)
  )

  (:action put-in-blender
    :parameters (?ingredient - ingredient ?blender - appliance)
    :precondition (and (at ?ingredient kitchen) (at ?blender kitchen))
    :effect (and (in ?ingredient ?blender) (not (at ?ingredient kitchen)))
  )

  (:action blend-pineapple
    :parameters (?pineapple - ingredient ?blender - appliance)
    :precondition (and (is-fresh ?pineapple) (in ?pineapple ?blender) (state ?blender off))
    :effect (and (blended ?pineapple) (state ?blender on))
  )

  (:action add-ingredient
    :parameters (?ingredient - ingredient ?blender - appliance)
    :precondition (and (at ?ingredient kitchen) (at ?blender kitchen))
    :effect (and (in ?ingredient ?blender) (not (at ?ingredient kitchen)))
  )

  (:action blend-all
    :parameters (?blender - appliance ?mixture - mixture)
    :precondition (and
      (in pineapple ?blender)
      (in milk ?blender)
      (in oil ?blender)
      (in sugar ?blender)
      (in extract ?blender)
      (state ?blender off)
    )
    :effect (and
      (not (in pineapple ?blender))
      (not (in milk ?blender))
      (not (in oil ?blender))
      (not (in sugar ?blender))
      (not (in extract ?blender))
      (in ?mixture ?blender)
      (state ?blender on)
    )
  )

  (:action pour-into-dish
    :parameters (?mixture - mixture ?blender - appliance ?dish - container)
    :precondition (and (in ?mixture ?blender) (at ?blender kitchen) (at ?dish kitchen))
    :effect (and
      (not (in ?mixture ?blender))
      (in ?mixture ?dish)
    )
  )

  (:action freeze-mixture
    :parameters (?mixture - mixture ?dish - container ?freezer - location ?sherbet - sherbet)
    :precondition (and (in ?mixture ?dish) (at ?dish kitchen) (at ?freezer kitchen))
    :effect (and
      (not (in ?mixture ?dish))
      (in ?sherbet ?dish)
      (at ?dish ?freezer)
      (frozen ?sherbet)
    )
  )

  (:action serve-sherbet
    :parameters (?sherbet - sherbet ?dish - container ?plate - container)
    :precondition (and (in ?sherbet ?dish) (at ?dish freezer) (frozen ?sherbet))
    :effect (and
      (not (in ?sherbet ?dish))
      (in ?sherbet ?plate)
      (at ?dish kitchen)
    )
  )
)
