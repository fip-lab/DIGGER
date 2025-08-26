(define (domain gears-of-war-headshot)
  (:requirements :strips :typing)
  (:types 
    weapon 
    agent
  )

  (:predicates
    (weapon_location ?w - weapon ?loc) ; 武器的位置
    (knows_where_to_aim ?a - agent)    ; 代理是否知道瞄准哪里
    (knows_shape_of_shotgun_aim ?a - agent) ; 代理是否知道霰弹枪瞄准的形状
    (knows_pistol_shots_needed ?a - agent)  ; 代理是否知道手枪需要多少发才能击中头部
    (knows_boomshot_odds ?a - agent)        ; 代理是否知道BoomShot击中头部的概率
  )

  ;; 使用狙击枪进行射击
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

  ;; 使用霰弹枪进行射击
  (:action shotgun_shot
    :parameters (?a - agent)
    :precondition (not (knows_shape_of_shotgun_aim ?a))
    :effect (knows_shape_of_shotgun_aim ?a)
  )

  ;; 使用手枪进行射击
  (:action pistol_shot
    :parameters (?a - agent)
    :precondition (not (knows_pistol_shots_needed ?a))
    :effect (knows_pistol_shots_needed ?a)
  )

  ;; 使用BoomShot进行射击
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
