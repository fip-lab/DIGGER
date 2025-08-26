(define (problem gears-of-war-headshot-problem)
  (:domain gears-of-war-headshot)
  (:objects
    weapon1 weapon2 - weapon
    player1 player2 player3 player4 - agent
  )

  (:init
    (weapon_location weapon1 still)
    (weapon_location weapon2 unfired)
    (not (knows_where_to_aim player1))
    (not (knows_shape_of_shotgun_aim player2))
    (not (knows_pistol_shots_needed player3))
    (not (knows_boomshot_odds player4))
  )

  (:goal
    (and
      (weapon_location weapon1 focused)
      (knows_where_to_aim player1)
      (knows_shape_of_shotgun_aim player2)
      (knows_pistol_shots_needed player3)
      (weapon_location weapon2 fired)
      (knows_boomshot_odds player4)
    )
  )
)
