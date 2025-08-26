(define (problem create_character)
  (:domain lego_star_wars)
  (:objects 
    game - entity
    character - entity
    level - entity
  )
  (:init 
    (not (game_played game))
    (not (selection_made character))
    (not (name_saved character))
    (not (level_completed level))
  )
  (:goal 
    (and 
      (game_played game)
      (selection_made character)
      (name_saved character)
      (level_completed level)
    )
  )
)