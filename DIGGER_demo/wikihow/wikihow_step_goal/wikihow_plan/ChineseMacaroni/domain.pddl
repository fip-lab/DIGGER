(define (domain chinese_macaroni)
  (:requirements :strips :typing)

  (:types
    ingredient container location - object
  )

  (:predicates
    ;;
    (at ?obj - object ?loc - location)
    ;;
    (cooked ?ing - ingredient)
    (cooled ?ing - ingredient)
    (seasoned ?ing - ingredient)
    (served ?ing - ingredient)
    ;;
    (in ?ing - ingredient ?cont - container)
  )

  ;;   1：
  (:action boil_macaroni
    :parameters (?macaroni - ingredient ?pot - container ?kitchen - location)
    :precondition (and
      (at ?macaroni ?kitchen)
      (at ?pot ?kitchen)
      (not (cooked ?macaroni))
    )
    :effect (and
      (cooked ?macaroni)
      (in ?macaroni ?pot)
    )
  )

  ;;   2：
  (:action cool_macaroni
    :parameters (?macaroni - ingredient ?pot - container ?sink - location)
    :precondition (and
      (cooked ?macaroni)
      (in ?macaroni ?pot)
      (at ?pot ?sink)
    )
    :effect (and
      (cooled ?macaroni)
    )
  )

  ;;   3：
  (:action toss_macaroni_in_pan
    :parameters (?macaroni - ingredient ?pan - container ?kitchen - location)
    :precondition (and
      (cooled ?macaroni)
      (at ?pan ?kitchen)
      (at ?macaroni ?kitchen)
    )
    :effect (and
      (in ?macaroni ?pan)
    )
  )

  ;;   4：
  (:action add_seasoning
    :parameters (?macaroni - ingredient ?pan - container)
    :precondition (and
      (in ?macaroni ?pan)
      (not (seasoned ?macaroni))
    )
    :effect (and
      (seasoned ?macaroni)
    )
  )

  ;;   5：
  (:action cook_macaroni_in_pan
    :parameters (?macaroni - ingredient ?pan - container)
    :precondition (and
      (in ?macaroni ?pan)
      (seasoned ?macaroni)
    )
    :effect (and
      (cooked ?macaroni)
    )
  )

  ;;   6：
  (:action serve_macaroni
    :parameters (?macaroni - ingredient ?plate - container ?dining_table - location ?pan - container)
    :precondition (and
      (cooked ?macaroni)
      (in ?macaroni ?pan)
      (at ?plate ?dining_table)
    )
    :effect (and
      (in ?macaroni ?plate)
      (served ?macaroni)
    )
  )
)
