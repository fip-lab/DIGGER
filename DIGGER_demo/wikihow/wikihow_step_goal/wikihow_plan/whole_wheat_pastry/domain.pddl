(define (domain whole_wheat_pastry)
  (:requirements :strips :typing)
  (:types
    ingredient tool container object location
  )

  (:predicates
    ;;
    (at ?obj - object ?loc - location)
    ;;
    (in ?ing - ingredient ?c - container)
    ;;
    (mixed ?c - container)
    ;;
    (pastry_ready)
    ;;
    (pastry_in_dish)
    ;;
    (edge_created)
  )

  ;;   1：
  (:action add_flour_and_salt
    :parameters (?flour - ingredient ?salt - ingredient ?bowl - container ?table - location)
    :precondition (and
      (at ?flour ?table)
      (at ?salt ?table)
      (at ?bowl ?table)
    )
    :effect (and
      (in ?flour ?bowl)
      (in ?salt ?bowl)
    )
  )

  ;;   2：
  (:action pour_in_oil
    :parameters (?oil - ingredient ?bowl - container ?flour - ingredient ?salt - ingredient ?table - location)
    :precondition (and
      (in ?flour ?bowl)
      (in ?salt ?bowl)
      (at ?oil ?table)
    )
    :effect (and
      (in ?oil ?bowl)
    )
  )

  ;;   3：
  (:action mix_ingredients
    :parameters (?oil - ingredient ?bowl - container ?flour - ingredient ?salt - ingredient)
    :precondition (and
      (in ?flour ?bowl)
      (in ?salt ?bowl)
      (in ?oil ?bowl)
    )
    :effect (and
      (mixed ?bowl)
    )
  )

  ;;   4：
  (:action prepare_pastry
    :parameters (?bowl - container ?wax_paper - object ?table - location)
    :precondition (and
      (mixed ?bowl)
      (at ?wax_paper ?table)
    )
    :effect (and
      (pastry_ready)
    )
  )

  ;;   5：
  (:action press_into_pie_dish
    :parameters (?pie_dish - container ?table - location)
    :precondition (and
      (pastry_ready)
      (at ?pie_dish ?table)
    )
    :effect (and
      (pastry_in_dish)
    )
  )

  ;;   6：
  (:action create_edge
    :parameters (?fork - object ?table - location)
    :precondition (and
      (pastry_in_dish)
      (at ?fork ?table)
    )
    :effect (and
      (edge_created)
    )
  )
)
