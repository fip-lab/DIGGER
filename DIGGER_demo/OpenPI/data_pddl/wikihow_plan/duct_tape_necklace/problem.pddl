(define (problem make_duct_tape_necklace)
  (:domain duct_tape_necklace)
  (:objects
    tape1 - tape
    table1 - table
    ends1 - ends
  )
  (:init
    (rolled tape1)
    (on_roll tape1)
    (elongated tape1)
    (sticky tape1)
    (separate_pieces tape1)
    (separate_ends ends1)
    (not (measured table1))
    (not (folded tape1))
    (not (in_pieces tape1))
    (not (smooth tape1))
    (not (one_piece tape1))
    (not (touching_ends ends1))
    (not (joined_ends ends1))
  )
  (:goal
    (and 
      (one_piece tape1)
      (joined_ends ends1)
    )
  )
)