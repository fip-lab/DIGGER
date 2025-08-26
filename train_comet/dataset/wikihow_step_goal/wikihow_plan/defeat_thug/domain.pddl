(define (domain defeat_thug)
  (:requirements :strips :typing)

  (:types
    person weapon ammo zombie location
  )

  (:predicates
    (knowledge_aware ?p - person)                    ; 人是否具备必要知识
    (ammo_assured ?a - ammo)                         ; 弹药是否充足
    (weapon_location ?w - weapon ?l - location)      ; 武器的位置
    (zombie_attacked ?z - zombie)                    ; 僵尸是否被攻击
    (weapon_thrown ?w - weapon)                      ; 武器是否已被投掷
  )

  ;; 获取知识的动作
  (:action acquire-knowledge
    :parameters (?p - person)
    :precondition (not (knowledge_aware ?p))
    :effect (knowledge_aware ?p)
  )

  ;; 确保弹药充足的动作
  (:action ensure-ammo
    :parameters (?a - ammo)
    :precondition (not (ammo_assured ?a))
    :effect (ammo_assured ?a)
  )

  ;; 装备武器的动作
  (:action equip-weapon
    :parameters (?p - person ?w - weapon)
    :precondition (knowledge_aware ?p)
    :effect (weapon_location ?w on_person)
  )

  ;; 使用武器攻击僵尸的动作（需要弹药，如枪械）
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
              (not (ammo_assured ?a)) ; 使用弹药后弹药减少
            )
  )

  ;; 使用投掷武器攻击僵尸的动作（如手榴弹、燃烧瓶）
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
              (weapon_location ?w thrown_at_enemy) ; 武器被投掷到敌人处
            )
  )
)
