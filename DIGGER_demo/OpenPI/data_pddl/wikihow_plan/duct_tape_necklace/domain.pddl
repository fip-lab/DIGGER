(define (domain duct_tape_necklace)
  (:requirements :strips :typing)
  (:types 
    tape 
    table 
    ends
  )
  (:predicates 
    (rolled ?t - tape)
    (in_pieces ?t - tape)
    (on_roll ?t - tape)
    (measured ?t - table)
    (elongated ?t - tape)
    (folded ?t - tape)
    (sticky ?t - tape)
    (smooth ?t - tape)
    (separate_pieces ?t - tape)
    (one_piece ?t - tape)
    (separate_ends ?e - ends)
    (touching_ends ?e - ends)
    (bare_ends ?e - ends)
    (joined_ends ?e - ends)
  )
  (:action unroll_tape
    :parameters (?t - tape)
    :precondition (and (rolled ?t) (on_roll ?t))
    :effect (and (in_pieces ?t) (not (rolled ?t)))
  )
  (:action measure_and_cut_tape
    :parameters (?t - tape ?tb - table)
    :precondition (and (in_pieces ?t) (elongated ?t) (not (measured ?tb)))
    :effect (and (measured ?tb) (in_pieces ?t))
  )
  (:action fold_tape
    :parameters (?t - tape)
    :precondition (and (in_pieces ?t) (elongated ?t))
    :effect (and (folded ?t) (not (elongated ?t)))
  )
  (:action smooth_tape
    :parameters (?t - tape)
    :precondition (and (folded ?t) (sticky ?t))
    :effect (and (smooth ?t) (not (sticky ?t)))
  )
  (:action tape_ends_together
    :parameters (?t - tape ?e - ends)
    :precondition (and (smooth ?t) (separate_pieces ?t) (separate_ends ?e))
    :effect (and (one_piece ?t) (joined_ends ?e) (not (separate_ends ?e)) (not (separate_pieces ?t)))
  )
)