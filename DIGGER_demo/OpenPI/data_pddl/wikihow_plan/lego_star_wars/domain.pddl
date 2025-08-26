(define (domain lego_star_wars)
  (:requirements :strips :typing)
  (:types 
    entity
  )
  (:predicates 
    (game_played ?e - entity)
    (selection_made ?e - entity)
    (name_saved ?e - entity)
    (level_completed ?e - entity)
  )

  (:action start_game
    :parameters (?g - entity)
    :precondition (not (game_played ?g))
    :effect (game_played ?g)
  )
  
  (:action select_character_parts
    :parameters (?s - entity)
    :precondition (not (selection_made ?s))
    :effect (selection_made ?s)
  )
  
  (:action save_name_and_exit
    :parameters (?n - entity)
    :precondition (and (selection_made ?n) (not (name_saved ?n)))
    :effect (name_saved ?n)
  )
  
  (:action complete_level
    :parameters (?l - entity)
    :precondition (and (name_saved ?l) (not (level_completed ?l)))
    :effect (level_completed ?l)
  )
)