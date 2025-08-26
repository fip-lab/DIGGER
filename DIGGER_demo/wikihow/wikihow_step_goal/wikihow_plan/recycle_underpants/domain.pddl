(define (domain recycle_underpants)
  (:requirements :strips :typing)

  (:types
    item
    underpants - item
    tool - item
    plant
    location - object
  )

  (:predicates
    ;;
    (at ?obj - item ?loc - location)
    ;;
    (is_old ?u - underpants)
    ;;
    (used_as_cleaning_rags ?u - underpants)
    (used_as_garden_ties ?u - underpants)
    (used_as_craft_item ?u - underpants)
    (used_as_stuffing ?u - underpants)
    (worn_by_child ?u - underpants)
    (donated ?u - underpants)
    ;;
    (tied ?pl - plant)
    ;;
    (available ?t - tool)
  )

  ;;   1:
  (:action make_cleaning_rags
    :parameters (?u - underpants)
    :precondition (and
      (at ?u drawer)
      (not (is_old ?u))
    )
    :effect (and
      (is_old ?u)
      (used_as_cleaning_rags ?u)
    )
  )

  ;;   2:
  (:action make_garden_ties
    :parameters (?u - underpants ?t - tool ?pl - plant)
    :precondition (and
      (at ?u drawer)
      (available ?t)
      (not (is_old ?u))
    )
    :effect (and
      (is_old ?u)
      (used_as_garden_ties ?u)
      (tied ?pl)
    )
  )

  ;;   3:
  (:action make_craft_item
    :parameters (?u - underpants ?t - tool)
    :precondition (and
      (at ?u drawer)
      (available ?t)
      (not (is_old ?u))
    )
    :effect (and
      (is_old ?u)
      (used_as_craft_item ?u)
    )
  )

  ;;   4:
  (:action use_as_stuffing
    :parameters (?u - underpants)
    :precondition (and
      (at ?u drawer)
      (is_old ?u)
    )
    :effect (used_as_stuffing ?u)
  )

  ;;   5:
  (:action child_wears_underpants
    :parameters (?u - underpants)
    :precondition (and
      (at ?u drawer)
      (is_old ?u)
    )
    :effect (worn_by_child ?u)
  )

  ;;   6:
  (:action donate_underpants
    :parameters (?u - underpants)
    :precondition (and
      (at ?u drawer)
      (is_old ?u)
    )
    :effect (donated ?u)
  )
)
