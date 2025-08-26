(define (domain board-a-small-boat)
  (:requirements :strips :typing)

  (:types
    passenger platform dock boat - object
  )

  (:predicates
    ;;       ：
    (at ?obj - object ?place - object)

    ;;
    (holding-rail ?p - passenger)

    ;;
    (legs-in-boat ?p - passenger)

    ;;
    (centered ?b - boat)

    ;;
    (crouched ?p - passenger)

    ;;
    (boat-stable ?b - boat)

    ;;
    (platform-present ?pl - platform)

    ;;
    (boat-at-dock ?b - boat)

    ;;
    (boat-moving ?b - boat)
  )

  ;;   1：
  (:action board_via_platform
    :parameters (?p - passenger ?pl - platform ?b - boat ?d - dock)
    :precondition (and
                    (platform-present ?pl)
                    (at ?p ?pl)
                    (at ?pl ?d)
                    (at ?b ?d))
    :effect (and
              (at ?p ?b)
              (not (at ?p ?pl))
             )
  )

  ;;   2：
  (:action hold_rails
    :parameters (?p - passenger ?b - boat)
    :precondition (at ?p ?b)
    :effect (holding-rail ?p)
  )

  ;;   3：
  (:action secure_legs
    :parameters (?p - passenger ?b - boat)
    :precondition (at ?p ?b)
    :effect (legs-in-boat ?p)
  )

  ;;   4：
  (:action stabilize_boat
    :parameters (?p - passenger ?b - boat)
    :precondition (and
                    (legs-in-boat ?p)
                    (holding-rail ?p)
                    (at ?p ?b))
    :effect (and
              (centered ?b)
              (crouched ?p)
              (boat-stable ?b)
             )
  )

  ;;   5：
  (:action others_keep_boat_steady
    :parameters (?op - passenger ?b - boat)
    :precondition (boat-stable ?b)
    :effect (at ?op ?b)
  )

)
