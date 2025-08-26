(define (problem recycle_underpants_problem)
  (:domain recycle_underpants)

  (:objects
    underpants1 underpants2 underpants3 underpants4 underpants5 underpants6 - underpants
    scissors1 - tool
    plant1 - plant
    drawer - location
  )

  (:init
    ;;
    (at underpants1 drawer)
    (at underpants2 drawer)
    (at underpants3 drawer)
    (at underpants4 drawer)
    (at underpants5 drawer)
    (at underpants6 drawer)

    ;;
    (available scissors1)
  )

  (:goal
    (and
      (used_as_cleaning_rags underpants1)
      (used_as_garden_ties underpants2)
      (tied plant1)
      (used_as_craft_item underpants3)
      (used_as_stuffing underpants4)
      (worn_by_child underpants5)
      (donated underpants6)
    )
  )
)
