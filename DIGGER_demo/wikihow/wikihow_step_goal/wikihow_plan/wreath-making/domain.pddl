(define (domain wreath-making)
  (:requirements :strips :typing)
  (:types
    hanger pliers paper_square wreath table)

  (:predicates
    ;;
    (shape-straight ?h - hanger)                ;
    (shape-circle ?h - hanger)                 ;
    (crumpled ?p - paper_square)               ;
    (threaded ?h - hanger ?p - paper_square)   ;
    (squares-pushed-away ?h - hanger)          ;
    (twisted-ends ?h - hanger)                 ;
    (squares-scrunched ?p - paper_square)      ;
    (completed ?w - wreath)                    ;
  )

  ;;   1：
  (:action untwist-and-shape-hanger
    :parameters (?h - hanger ?p - pliers)
    :precondition (shape-straight ?h)
    :effect (and
              (shape-circle ?h)
              (not (shape-straight ?h))
            )
  )

  ;;   2：
  (:action crumple-and-thread-paper
    :parameters (?p - paper_square ?h - hanger)
    :precondition (and
                    (shape-circle ?h)
                    (not (crumpled ?p))
                    (not (threaded ?h ?p))
                  )
    :effect (and
              (crumpled ?p)
              (threaded ?h ?p)
            )
  )

  ;;   3：
  (:action push-squares-and-twist-ends
    :parameters (?h - hanger ?p - pliers)
    :precondition (and
                    (shape-circle ?h)
                    (threaded ?h paper1)
                    (threaded ?h paper2)
                    (threaded ?h paper3)
                  )
    :effect (and
              (squares-pushed-away ?h)
              (twisted-ends ?h)
            )
  )

  ;;   4：
  (:action slide-and-scrunch-squares
    :parameters (?p - paper_square ?h - hanger)
    :precondition (and
                    (squares-pushed-away ?h)
                    (threaded ?h ?p)
                    (crumpled ?p)
                  )
    :effect (squares-scrunched ?p)
  )

  ;;   5：
  (:action finish-wreath
    :parameters (?w - wreath ?h - hanger)
    :precondition (and
                    (twisted-ends ?h)
                    (squares-scrunched paper1)
                    (squares-scrunched paper2)
                    (squares-scrunched paper3)
                  )
    :effect (completed ?w)
  )
)
