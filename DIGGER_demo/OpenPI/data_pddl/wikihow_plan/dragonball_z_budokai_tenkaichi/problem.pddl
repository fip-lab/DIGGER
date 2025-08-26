(define (problem dragonball_z_budokai_tenkaichi_problem)
  (:domain dragonball_z_budokai_tenkaichi)

  (:objects
    player1 player2 - player
    goku - character
    stage1 - stage
    duel1 - vs_duel
    away_from_wall against_wall on_middle_of_street on_end_of_street - location
  )

  (:init
    (not (vs_duel_selected duel1))
    (not (player_selected player1))
    (not (player_selected player2))
    (present goku)
    (not (character_selected player1 goku))
    (not (character_selected player2 goku))
    (not (stage_specified stage1))
    (located player1 away_from_wall)
    (located player2 away_from_wall)
    (not (against_wall player1))
    (not (against_wall player2))
    (not (separated player1 player2))
  )

  (:goal
    (and
      (vs_duel_selected duel1)
      (player_selected player1)
      (player_selected player2)
      (character_selected player1 goku)
      (character_selected player2 goku)
      (stage_specified stage1)
      (located player1 against_wall)
      (located player2 against_wall)
      (against_wall player1)
      (against_wall player2)
      (separated player1 player2)
    )
  )
)
