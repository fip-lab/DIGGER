(define (problem defeat_thug_problem)
  (:domain defeat_thug)
  
  (:objects 
    you - person
    grenades molotov_cocktails gun knife - weapon
    ammo_gun grenades_ammo molotov_ammo - ammo
    thug1 - zombie
    on_person on_ground thrown_at_enemy - location
  )

  (:init
    (not (knowledge_aware you))
    (not (ammo_assured ammo_gun))
    (not (ammo_assured grenades_ammo))
    (not (ammo_assured molotov_ammo))
    (weapon_location gun on_ground)
    (weapon_location knife on_ground)
    (weapon_location grenades on_ground)
    (weapon_location molotov_cocktails on_ground)
    (not (zombie_attacked thug1))
  )

  (:goal
    (and
      (zombie_attacked thug1)
    )
  )
)
