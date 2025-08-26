(define (domain windshield_cleaner)
  (:requirements :strips :typing)

  (:types
    object
    person tool container surface location - object
  )

  (:predicates
    ;;
    (owned ?p - person ?t - tool)

    ;;
    (at_location ?obj - object ?loc - location) ;
    (in_container ?obj - object ?c - container) ;

    ;;
    (dirty ?s - surface)
    (clean ?s - surface)

    ;;
    (used ?t - tool)
    (clean_tool ?t - tool)

    ;;
    (has_money ?p - person)
  )

  ;;   1：
  (:action purchase_eraser
    :parameters (?p - person ?t - tool ?store - location ?home - location)
    :precondition (and
      (at_location ?t ?store)
      (has_money ?p)
      (not (owned ?p ?t))
    )
    :effect (and
      (owned ?p ?t)
      (not (at_location ?t ?store))
      (at_location ?t ?home)
      (not (has_money ?p))
    )
  )

  ;;   2：
  (:action store_eraser
    :parameters (?p - person ?t - tool ?c - container ?home_loc - location)
    :precondition (and
      (owned ?p ?t)
      (at_location ?t ?home_loc)
    )
    :effect (and
      (in_container ?t ?c)
      (not (at_location ?t ?home_loc))
    )
  )

  ;;   3：
  (:action use_eraser_to_clean
    :parameters (?p - person ?t - tool ?s - surface ?c - container ?windshield_loc - location)
    :precondition (and
      (owned ?p ?t)
      (in_container ?t ?c)
      (dirty ?s)
    )
    :effect (and
      (clean ?s)
      (used ?t)
      (at_location ?t ?windshield_loc)
      (not (in_container ?t ?c))
    )
  )

  ;;   4：
  (:action replace_eraser
    :parameters (?p - person ?t - tool ?c - container ?windshield_loc - location)
    :precondition (and
      (owned ?p ?t)
      (used ?t)
      (at_location ?t ?windshield_loc)
    )
    :effect (and
      (not (used ?t))
      (clean_tool ?t)
      (in_container ?t ?c)
      (not (at_location ?t ?windshield_loc))
    )
  )
)
