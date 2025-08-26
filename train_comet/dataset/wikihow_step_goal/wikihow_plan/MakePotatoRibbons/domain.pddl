(define (domain MakePotatoRibbons)
  (:requirements :strips :typing)

  (:types
    ingredient utensil appliance location dish - object
  )

  (:predicates
    ;; 位置相关谓词
    (at ?obj - object ?loc - location)

    ;; 状态相关谓词
    (washed ?potato - ingredient)
    (peeled ?potato - ingredient)
    (cut ?potato - ingredient)
    (drained ?potato - ingredient)
    (fried ?potato - ingredient)
    (in_dish ?potato - ingredient ?dish - dish)
    (clean ?utensil - utensil)
    (dirty ?utensil - utensil)
    (heated ?appliance - appliance)
    (has_oil ?appliance - appliance)
  )

  ;; 动作1：洗土豆
  (:action wash_potatoes
    :parameters (?potato - ingredient ?sink - utensil ?cloth - utensil)
    :precondition (and
      (at ?potato kitchen_counter)
      (at ?sink kitchen_sink)
      (at ?cloth kitchen_counter)
      (clean ?sink)
    )
    :effect (and
      (washed ?potato)
      (dirty ?sink)
    )
  )

  ;; 动作2：切土豆
  (:action cut_potatoes
    :parameters (?potato - ingredient ?peeler - utensil)
    :precondition (and
      (washed ?potato)
      (at ?potato kitchen_counter)
      (at ?peeler kitchen_counter)
      (clean ?peeler)
    )
    :effect (and
      (peeled ?potato)
      (cut ?potato)
      (dirty ?peeler)
    )
  )

  ;; 动作3：沥干土豆
  (:action drain_potatoes
    :parameters (?potato - ingredient ?cloth - utensil)
    :precondition (and
      (cut ?potato)
      (at ?potato kitchen_counter)
      (at ?cloth kitchen_counter)
      (clean ?cloth)
    )
    :effect (and
      (drained ?potato)
      (dirty ?cloth)
    )
  )

  ;; 动作4：炸土豆丝
  (:action fry_potatoes
    :parameters (?potato - ingredient ?pan - utensil ?stove - appliance)
    :precondition (and
      (drained ?potato)
      (at ?pan kitchen_stove)
      (at ?stove kitchen_stove)
      (clean ?pan)
      (heated ?stove)
      (has_oil ?stove)
    )
    :effect (and
      (fried ?potato)
      (dirty ?pan)
    )
  )

  ;; 动作5：上菜
  (:action serve_potatoes
    :parameters (?potato - ingredient ?dish - dish)
    :precondition (and
      (fried ?potato)
      (at ?dish dining_table)
    )
    :effect (and
      (in_dish ?potato ?dish)
      (not (fried ?potato))
    )
  )
)

