(define (domain spy_mission)
  (:requirements :strips :typing)

  (:types
    person
    gear
    location
    victim
  )

  (:predicates
    ;; 组是否已形成
    (group-formed)

    ;; 个人是否属于间谍组
    (member-of-group ?p - person)

    ;; 个人是否拥有特定装备
    (has-gear ?p - person ?g - gear)

    ;; 地点是否已设置
    (location-set ?l - location)

    ;; 是否已识别受害者
    (victim-identified ?v - victim)
  )

  ;; 动作1：组建间谍组
  (:action form_spy_group
    :parameters (?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
                    (not (group-formed))
                    (member-of-group ?p1)
                    (member-of-group ?p2)
                    (member-of-group ?p3))
    :effect (group-formed)
  )

  ;; 动作2：设置间谍基地地点
  (:action set_location
    :parameters (?l - location)
    :precondition (and
                    (group-formed)
                    (not (location-set ?l)))
    :effect (location-set ?l)
  )

  ;; 动作3：收集装备
  (:action gather_gear
    :parameters (?p - person ?g - gear)
    :precondition (and
                    (group-formed)
                    (location-set safehouse)
                    (not (has-gear ?p ?g)))
    :effect (has-gear ?p ?g)
  )

  ;; 动作4：识别目标受害者
  (:action identify_victim
    :parameters (?v - victim)
    :precondition (not (victim-identified ?v))
    :effect (victim-identified ?v)
  )
)
