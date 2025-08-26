(define (domain spy_mission)
  (:requirements :strips :typing)

  (:types
    person
    gear
    location
    victim
  )

  (:predicates
    ;;
    (group-formed)

    ;;
    (member-of-group ?p - person)

    ;;
    (has-gear ?p - person ?g - gear)

    ;;
    (location-set ?l - location)

    ;;
    (victim-identified ?v - victim)
  )

  ;;   1：
  (:action form_spy_group
    :parameters (?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
                    (not (group-formed))
                    (member-of-group ?p1)
                    (member-of-group ?p2)
                    (member-of-group ?p3))
    :effect (group-formed)
  )

  ;;   2：
  (:action set_location
    :parameters (?l - location)
    :precondition (and
                    (group-formed)
                    (not (location-set ?l)))
    :effect (location-set ?l)
  )

  ;;   3：
  (:action gather_gear
    :parameters (?p - person ?g - gear)
    :precondition (and
                    (group-formed)
                    (location-set safehouse)
                    (not (has-gear ?p ?g)))
    :effect (has-gear ?p ?g)
  )

  ;;   4：
  (:action identify_victim
    :parameters (?v - victim)
    :precondition (not (victim-identified ?v))
    :effect (victim-identified ?v)
  )
)
