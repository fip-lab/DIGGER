(define (domain paint-bare-wood)
  (:requirements :strips :typing)

  (:types
    person tool material object
  )

  (:predicates
    ;;
    (has_tool ?p - person ?t - tool)
    (has_paint ?p - person ?m - material)

    ;;
    (clean ?t - tool)
    (dirty ?t - tool)

    ;;
    (present ?o - object)
    (painted_under_coat ?o - object)
    (painted_second_coat ?o - object)
    (finished_painting ?o - object)

    ;;
    (paint_applied ?o - object ?m - material)
  )

  ;;   1：
  (:action acquire_paint
    :parameters (?p - person ?m - material)
    :precondition (and
      (not (has_paint ?p ?m))
    )
    :effect (has_paint ?p ?m)
  )

  ;;   2：
  (:action acquire_tool
    :parameters (?p - person ?t - tool)
    :precondition (and
      (not (has_tool ?p ?t))
    )
    :effect (has_tool ?p ?t)
  )

  ;;   3：
  (:action clean_tool
    :parameters (?t - tool)
    :precondition (and
      (dirty ?t)
    )
    :effect (clean ?t)
  )

  ;;   4：
  (:action apply_under_coat
    :parameters (?p - person ?t - tool ?m - material ?o - object)
    :precondition (and
      (has_paint ?p ?m)
      (has_tool ?p ?t)
      (clean ?t)
      (present ?o)
      (not (painted_under_coat ?o))
    )
    :effect (and
      (paint_applied ?o ?m)
      (painted_under_coat ?o)
      (dirty ?t)
    )
  )

  ;;   5：
  (:action apply_second_coat
    :parameters (?p - person ?t - tool ?m - material ?o - object)
    :precondition (and
      (has_paint ?p ?m)
      (has_tool ?p ?t)
      (dirty ?t)
      (present ?o)
      (painted_under_coat ?o)
      (not (painted_second_coat ?o))
    )
    :effect (and
      (paint_applied ?o ?m)
      (painted_second_coat ?o)
      (dirty ?t)
    )
  )

  ;;   6：
  (:action finish_painting
    :parameters (?p - person ?o - object)
    :precondition (and
      (painted_second_coat ?o)
    )
    :effect (finished_painting ?o)
  )
)
