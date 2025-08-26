(define (domain evolve_vulpix)
  (:requirements :strips :typing)
  (:types stone vulpix bag)
  
  (:predicates
    (has_vulpix ?vulpix)
    (found_fire_stone ?stone)
    (selected_stone ?stone)
    (selected_bag ?bag)
    (vulpix_evolved ?vulpix)
  )

  (:action catch_or_trade_vulpix
    :parameters (?vulpix)
    :precondition (not (has_vulpix ?vulpix))
    :effect (has_vulpix ?vulpix)
  )
  
  (:action find_fire_stone
    :parameters (?stone)
    :precondition (not (found_fire_stone ?stone))
    :effect (found_fire_stone ?stone)
  )

  (:action select_stone
    :parameters (?stone)
    :precondition (and (found_fire_stone ?stone) (not (selected_stone ?stone)))
    :effect (selected_stone ?stone)
  )

  (:action select_bag
    :parameters (?bag)
    :precondition (not (selected_bag ?bag))
    :effect (selected_bag ?bag)
  )

  (:action wait_for_evolution
    :parameters (?vulpix)
    :precondition (and (has_vulpix ?vulpix) (selected_stone stone) (selected_bag bag))
    :effect (vulpix_evolved ?vulpix)
  )
)