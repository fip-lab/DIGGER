(define (domain defeat_thug)
  (:requirements :strips :typing)

  (:types
    person weapon ammo zombie location
  )

  (:predicates
    (knowledge_aware ?p - person)                    ;
    (ammo_assured ?a - ammo)                         ;
    (weapon_location ?w - weapon ?l - location)      ;
    (zombie_attacked ?z - zombie)                    ;
    (weapon_thrown ?w - weapon)                      ;
  )

  ;;
  (:action acquire-knowledge
    :parameters (?p - person)
    :precondition (not (knowledge_aware ?p))
    :effect (knowledge_aware ?p)
  )

  ;;
  (:action ensure-ammo
    :parameters (?a - ammo)
    :precondition (not (ammo_assured ?a))
    :effect (ammo_assured ?a)
  )

  ;;
  (:action equip-weapon
    :parameters (?p - person ?w - weapon)
    :precondition (knowledge_aware ?p)
    :effect (weapon_location ?w on_person)
  )

  ;;            （    ，   ）
  (:action attack-with-weapon
    :parameters (?p - person ?w - weapon ?a - ammo ?z - zombie)
    :precondition (and
                    (knowledge_aware ?p)
                    (weapon_location ?w on_person)
                    (ammo_assured ?a)
                    (not (zombie_attacked ?z))
                   )
    :effect (and
              (zombie_attacked ?z)
              (not (ammo_assured ?a)) ;
            )
  )

  ;;              （    、   ）
  (:action throw-weapon
    :parameters (?p - person ?w - weapon ?z - zombie)
    :precondition (and
                    (knowledge_aware ?p)
                    (weapon_location ?w on_person)
                    (not (zombie_attacked ?z))
                   )
    :effect (and
              (zombie_attacked ?z)
              (weapon_thrown ?w)
              (weapon_location ?w thrown_at_enemy) ;
            )
  )
)
