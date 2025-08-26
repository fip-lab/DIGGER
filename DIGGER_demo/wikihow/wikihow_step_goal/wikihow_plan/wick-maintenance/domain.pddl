(define (domain wick-maintenance)
  (:requirements :strips :typing)
  (:types
    wick vinegar lamp container
  )

  (:predicates
    (in_lamp ?w - wick)                   ;
    (removed ?w - wick)                   ;
    (wet ?w - wick)                       ;
    (dry ?w - wick)                       ;
    (in_vinegar ?w - wick)                ;
    (vinegar_in_container ?v - vinegar)    ;
    (in_container ?c - container ?v - vinegar) ;
    (placed_back ?w - wick ?l - lamp)     ;
    (get ?w - wick)
  )

  ;;
  (:action remove_wicks
    :parameters (?w - wick)
    :precondition (and (in_lamp ?w))
    :effect (and
     (removed ?w)
     (not (in_lamp ?w))
     (get ?w)
     )
  )

  ;;
  (:action put_vinegar_in_container
    :parameters (?v - vinegar ?c - container)
    :precondition (not (vinegar_in_container ?v))
    :effect (and (vinegar_in_container ?v) (in_container ?c ?v))
  )

  ;;
  (:action dip_wicks_in_vinegar
    :parameters (?w - wick ?v - vinegar ?c - container)
    :precondition (and (get ?w) (vinegar_in_container ?v) (in_container ?c ?v))
    :effect (and (wet ?w) (in_vinegar ?w))
  )

  ;;
  (:action dry_wicks
    :parameters (?w - wick)
    :precondition (wet ?w)
    :effect (and (dry ?w) (not (wet ?w)))
  )

  ;;
  (:action place_wicks_in_lamp
    :parameters (?w - wick ?l - lamp)
    :precondition (and (dry ?w) (not (in_lamp ?w)))
    :effect (and (in_lamp ?w) (placed_back ?w ?l))
  )
)
