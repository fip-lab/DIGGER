(define (domain carob_fruit_balls_making)
  (:requirements :strips :typing)

  (:types
    person tool container ingredient appliance location - object
  )

  (:predicates
    ;;
    (owned ?p - person ?obj - object)

    ;;
    (at ?obj - object ?loc - location)
    (in ?ing - ingredient ?cont - container)
    ;;
    (clean ?obj - object)
    (dirty ?obj - object)
    (mixed ?cont - container)
    (rolled ?cont - container)
    (frozen ?cont - container)
    (served ?cont - container)
  )

  ;;   1：
  (:action mix_ingredients
    :parameters (?p - person ?bowl - container ?spoon - tool
                    ?ing1 - ingredient ?ing2 - ingredient
                    ?ing3 - ingredient ?ing4 - ingredient)
    :precondition (and
      (owned ?p ?bowl) (clean ?bowl) (at ?bowl kitchen_counter1)
      (owned ?p ?spoon) (clean ?spoon)
      (owned ?p ?ing1) (clean ?ing1) (at ?ing1 kitchen_counter1)
      (owned ?p ?ing2) (clean ?ing2) (at ?ing2 kitchen_counter1)
      (owned ?p ?ing3) (clean ?ing3) (at ?ing3 kitchen_counter1)
      (owned ?p ?ing4) (clean ?ing4) (at ?ing4 kitchen_counter1)
    )
    :effect (and
      (mixed ?bowl)
      (dirty ?bowl)
      (dirty ?spoon)
      (in ?ing1 ?bowl)
      (in ?ing2 ?bowl)
      (in ?ing3 ?bowl)
      (in ?ing4 ?bowl)
    )
  )

  ;;   2：
  (:action roll_into_balls
    :parameters (?p - person ?bowl - container ?spoon - tool)
    :precondition (and
      (owned ?p ?bowl) (mixed ?bowl) (at ?bowl kitchen_counter1)
      (owned ?p ?spoon) (clean ?spoon)
    )
    :effect (and
      (rolled ?bowl)
      (dirty ?spoon)
    )
  )

  ;;   3：
  (:action freeze_balls
    :parameters (?p - person ?bowl - container ?freezer - appliance)
    :precondition (and
      (owned ?p ?bowl) (rolled ?bowl) (at ?bowl kitchen_counter1)
      (owned ?p ?freezer) (at ?freezer kitchen_counter1)
    )
    :effect (and
      (frozen ?bowl)
      (at ?bowl freezer_location)
    )
  )

  ;;   4：
  (:action serve_balls
    :parameters (?p - person ?bowl - container ?plate - container)
    :precondition (and
      (owned ?p ?bowl) (frozen ?bowl) (at ?bowl freezer_location)
      (owned ?p ?plate) (at ?plate dining_table1)
    )
    :effect (and
      (served ?bowl)
      (at ?bowl dining_table1)
    )
  )
)
