(define (domain windshield_cleaner)
  (:requirements :strips :typing)

  (:types
    object
    person tool container surface location - object
  )

  (:predicates
    ;; 拥有关系
    (owned ?p - person ?t - tool)

    ;; 位置关系
    (at_location ?obj - object ?loc - location) ; 物品位于某位置
    (in_container ?obj - object ?c - container) ; 物品位于某容器内

    ;; 表面状态
    (dirty ?s - surface)
    (clean ?s - surface)

    ;; 工具状态
    (used ?t - tool)
    (clean_tool ?t - tool)

    ;; 金钱状态
    (has_money ?p - person)
  )

  ;; 动作1：购买擦子
  (:action purchase_eraser
    :parameters (?p - person ?t - tool ?store - location ?home - location)
    :precondition (and
      (at_location ?t ?store)
      (has_money ?p)
      (not (owned ?p ?t))
    )
    :effect (and
      (owned ?p ?t)
      (not (at_location ?t ?store))
      (at_location ?t ?home)
      (not (has_money ?p))
    )
  )

  ;; 动作2：将擦子存放在容器中
  (:action store_eraser
    :parameters (?p - person ?t - tool ?c - container ?home_loc - location)
    :precondition (and
      (owned ?p ?t)
      (at_location ?t ?home_loc)
    )
    :effect (and
      (in_container ?t ?c)
      (not (at_location ?t ?home_loc))
    )
  )

  ;; 动作3：使用擦子清洁挡风玻璃
  (:action use_eraser_to_clean
    :parameters (?p - person ?t - tool ?s - surface ?c - container ?windshield_loc - location)
    :precondition (and
      (owned ?p ?t)
      (in_container ?t ?c)
      (dirty ?s)
    )
    :effect (and
      (clean ?s)
      (used ?t)
      (at_location ?t ?windshield_loc)
      (not (in_container ?t ?c))
    )
  )

  ;; 动作4：使用后替换擦子
  (:action replace_eraser
    :parameters (?p - person ?t - tool ?c - container ?windshield_loc - location)
    :precondition (and
      (owned ?p ?t)
      (used ?t)
      (at_location ?t ?windshield_loc)
    )
    :effect (and
      (not (used ?t))
      (clean_tool ?t)
      (in_container ?t ?c)
      (not (at_location ?t ?windshield_loc))
    )
  )
)
