(define (domain gears-of-war-headshot)
  (:requirements :strips :typing)
  (:types 
    weapon 
    agent
  )

  (:predicates
    (weapon_location ?w - weapon ?loc) ;
    (knows_where_to_aim ?a - agent)    ;
    (knows_shape_of_shotgun_aim ?a - agent) ;
    (knows_pistol_shots_needed ?a - agent)  ;
    (knows_boomshot_odds ?a - agent)        ;       BoomShot
  )

  ;;
  (:action sniper_shot
    :parameters (?w - weapon ?a - agent)
    :precondition (and
                    (weapon_location ?w still)
                    (not (knows_where_to_aim ?a))
                   )
    :effect (and
             (weapon_location ?w focused)
             (knows_where_to_aim ?a)
            )
  )

  ;;
  (:action shotgun_shot
    :parameters (?a - agent)
    :precondition (not (knows_shape_of_shotgun_aim ?a))
    :effect (knows_shape_of_shotgun_aim ?a)
  )

  ;;
  (:action pistol_shot
    :parameters (?a - agent)
    :precondition (not (knows_pistol_shots_needed ?a))
    :effect (knows_pistol_shots_needed ?a)
  )

  ;;   BoomShot
  (:action boomshot_shot
    :parameters (?w - weapon ?a - agent)
    :precondition (and
                    (weapon_location ?w unfired)
                    (not (knows_boomshot_odds ?a))
                   )
    :effect (and
             (weapon_location ?w fired)
             (knows_boomshot_odds ?a)
            )
  )
)
