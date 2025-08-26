(define (domain pinwheel-wreath)
  (:requirements :strips :typing)
  (:types
    paper wreath pinwheel twine)

  (:predicates
    ;;
    (selected ?p - paper)          ;
    (knowledge ?p - paper)         ;
    (has-shape ?p - paper)         ;

    ;;
    (made ?pw - pinwheel)          ;
    (attached ?pw - pinwheel)      ;

    ;;
    (base-chosen ?w - wreath)      ;

    ;;   /
    (twine-attached ?t - twine)    ;   /
    (twine-located ?t - twine)     ;   /
  )

  ;;    1:
  (:action select-paper
    :parameters (?p - paper)
    :precondition (and (not (selected ?p)) (not (knowledge ?p)))
    :effect (and (selected ?p) (knowledge ?p))
  )

  ;;    2:
  (:action make-pinwheel
    :parameters (?pw - pinwheel ?p - paper)
    :precondition (and (selected ?p) (has-shape ?p) (not (made ?pw)))
    :effect (made ?pw)
  )

  ;;    3:
  (:action choose-wreath-base
    :parameters (?w - wreath)
    :precondition (not (base-chosen ?w))
    :effect (base-chosen ?w)
  )

  ;;    4:     /
  (:action attach-twine
    :parameters (?t - twine ?w - wreath)
    :precondition (and (base-chosen ?w) (not (twine-attached ?t)) (not (twine-located ?t)))
    :effect (and (twine-attached ?t) (twine-located ?t))
  )

  ;;    5:
  (:action attach-pinwheel
    :parameters (?pw - pinwheel ?w - wreath)
    :precondition (and (made ?pw) (base-chosen ?w) (not (attached ?pw)))
    :effect (attached ?pw)
  )
)
