(define (domain asparagus_serrano)
  (:requirements :strips :typing)

  (:types
    person tool material object appliance container location - object
  )

  (:predicates
    ;; 位置相关谓词
    (in ?obj - object ?cont - container)
    (at_location ?obj - object ?loc - location)

    ;; 状态相关谓词
    (clean ?t - tool)
    (oven_preheated)
    (oven_on)
    (prepared_asparagus ?a - object)
    (wrapped_asparagus ?a - object)
    (roasted_asparagus ?a - object)
    (served_asparagus ?a - object)
  )

  ;; 动作1：预热烤箱
  (:action preheat_oven
    :parameters (?oven - appliance)
    :precondition (and
      (at_location ?oven kitchen)
      (not (oven_preheated))
      (not (oven_on))
    )
    :effect (and
      (oven_on)
      (oven_preheated)
    )
  )

  ;; 动作2：添加橄榄油到烤盘
  (:action add_oil_to_tin
    :parameters (?oil - material ?tin - container)
    :precondition (and
      (in ?oil pantry)
      (at_location ?tin kitchen)
    )
    :effect (in ?oil ?tin)
  )

  ;; 动作3：准备芦笋
  (:action prepare_asparagus
    :parameters (?asparagus - object ?board - tool)
    :precondition (and
      (in ?asparagus fridge)
      (at_location ?board kitchen)
      (clean ?board)
    )
    :effect (prepared_asparagus ?asparagus)
  )

  ;; 动作4：用火腿包裹芦笋
  (:action wrap_asparagus_with_ham
    :parameters (?asparagus - object ?ham - material)
    :precondition (and
      (prepared_asparagus ?asparagus)
      (in ?ham fridge)
    )
    :effect (wrapped_asparagus ?asparagus)
  )

  ;; 动作5：将芦笋放入烤盘
  (:action place_asparagus_in_tin
    :parameters (?asparagus - object ?tin - container)
    :precondition (and
      (wrapped_asparagus ?asparagus)
      (in olive_oil1 tin1)
    )
    :effect (in ?asparagus ?tin)
  )

  ;; 动作6：将烤盘放入烤箱
  (:action put_tin_in_oven
    :parameters (?tin - container ?oven - appliance ?asparagus - object)
    :precondition (and
      (oven_preheated)
      (in ?asparagus ?tin)
    )
    :effect (in ?asparagus ?oven)
  )

  ;; 动作7：烘烤芦笋
  (:action roast_asparagus
    :parameters (?asparagus - object ?oven - appliance)
    :precondition (and
      (in ?asparagus ?oven)
      (oven_on)
      (not (roasted_asparagus ?asparagus))
    )
    :effect (roasted_asparagus ?asparagus)
  )

  ;; 动作8：上菜
  (:action serve_asparagus
    :parameters (?asparagus - object ?dish - container)
    :precondition (and
      (roasted_asparagus ?asparagus)
      (in ?asparagus tin1)
      (at_location ?dish kitchen)
    )
    :effect (and
      (in ?asparagus ?dish)
      (served_asparagus ?asparagus)
    )
  )
)
