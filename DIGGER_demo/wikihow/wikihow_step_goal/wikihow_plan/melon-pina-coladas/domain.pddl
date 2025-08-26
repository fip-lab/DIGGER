(define (domain melon-pina-coladas)
  (:requirements :strips :typing)

  (:types
    ingredient mixture pitcher glass refrigerator honeydew - object
  )

  (:predicates
    ;;
    (in ?item - object ?container - object)

    ;;
    (mixed ?p - pitcher)
    (chilled ?p - pitcher)
    (in_glass ?m - mixture ?g - glass)
    (garnished ?h - honeydew ?g - glass)
    (on_table ?g - glass)
    (empty ?p - pitcher)
  )

  ;;   1：
  (:action pour_ingredients_into_pitcher
    :parameters (?m - mixture ?p - pitcher ?l - object)
    :precondition (and
      (empty ?p)
      (in ?m ?l)
    )
    :effect (and
      (in ?m ?p)
      (not (empty ?p))
      (not (in ?m ?l))
    )
  )

  ;;   2：
  (:action mix_pitcher
    :parameters (?p - pitcher ?m - mixture)
    :precondition (and
      (in ?m ?p)
      (not (mixed ?p))
    )
    :effect (mixed ?p)
  )

  ;;   3：
  (:action chill_mixture
    :parameters (?p - pitcher ?r - refrigerator)
    :precondition (mixed ?p)
    :effect (chilled ?p)
  )

  ;;   4：
  (:action pour_into_glass
    :parameters (?m - mixture ?p - pitcher ?g - glass)
    :precondition (and
      (chilled ?p)
      (in ?m ?p)
    )
    :effect (and
      (in_glass ?m ?g)
      (empty ?p)
      (not (in ?m ?p))
    )
  )

  ;;   5：
  (:action add_garnish
    :parameters (?h - honeydew ?g - glass ?m - mixture)
    :precondition (in_glass ?m ?g)
    :effect (and
      (garnished ?h ?g)
      (on_table ?g)
    )
  )
)
