(define (problem ninja_defuse)
  (:domain call_of_duty)

  (:objects
    character - game_character
    current_routes - routes
    game_bomb - bomb
    player_pistol - pistol
    further_out in hidden now_at_bomb - place
    uncovered covered uninvestigated investigated - state
    pulling_out_pistol investigating waiting defusing - task
    in_inventory equipped concealed exposed - state
    planted defused - state
  )

  (:init
    ;;
    (location character further_out)

    ;;
    (focus character pulling_out_pistol)

    ;;
    (coverage current_routes uncovered)
    (appearance current_routes uncovered)
    (knowledge current_routes uninvestigated)

    ;;
    (skill game_bomb unplanted)

    ;;
    (pistol_location player_pistol concealed)
    (availability player_pistol in_inventory)
  )

  (:goal
    (and
      ;;
      (location character now_at_bomb)
      (focus character defusing)

      ;;
      (skill game_bomb defused)
    )
  )
)
