(define (domain taco-filling)
  (:requirements :strips :typing)
  (:types
    ingredient tool appliance location dish
  )

  (:predicates
    ;; 位置谓词
    (at ?i - ingredient ?l - location)
    (at-tool ?t - tool ?l - location)
    (at-appliance ?a - appliance ?l - location)
    (at-dish ?d - dish ?l - location)

    ;; 状态谓词
    (cooked ?i - ingredient)
    (in-pan ?i - ingredient ?pan - tool)
    (in-dish ?i - ingredient ?d - dish)
    (heated ?pan - tool)
    (simmering ?pan - tool)
    (clean ?pan - tool)
    (drained ?pan - tool)
    (has-power ?a - appliance)
  )

  ;; 动作1：煎炒肉和洋葱
  (:action brown_meat_and_onion
    :parameters (?meat - ingredient ?onion - ingredient ?pan - tool ?stove - appliance ?loc - location)
    :precondition (and
      (at ?meat ?loc)
      (at ?onion ?loc)
      (at-tool ?pan ?loc)
      (at-appliance ?stove ?loc)
      (has-power ?stove)
      (clean ?pan)
    )
    :effect (and
      (cooked ?meat)
      (cooked ?onion)
      (heated ?pan)
      (not (clean ?pan))
      (in-pan ?meat ?pan)
      (in-pan ?onion ?pan)
      (not (at ?meat ?loc))
      (not (at ?onion ?loc))
    )
  )

  ;; 动作2：将煎锅移到水槽
  (:action move_pan_to_sink
    :parameters (?pan - tool ?from - location ?to - location)
    :precondition (and
      (at-tool ?pan ?from)
    )
    :effect (and
      (at-tool ?pan ?to)
      (not (at-tool ?pan ?from))
    )
  )

  ;; 动作3：排出多余的脂肪
  (:action drain_fat
    :parameters (?pan - tool)
    :precondition (and
      (heated ?pan)
      (at-tool ?pan sink_location)
    )
    :effect (and
      (drained ?pan)
    )
  )

  ;; 动作4：将煎锅移回柜台
  (:action move_pan_to_counter
    :parameters (?pan - tool ?from - location ?to - location)
    :precondition (and
      (at-tool ?pan ?from)
    )
    :effect (and
      (at-tool ?pan ?to)
      (not (at-tool ?pan ?from))
    )
  )

  ;; 动作5：添加剩余食材并炖煮
  (:action add_ingredients_and_simmer
    :parameters (?pan - tool ?ingredient1 - ingredient ?ingredient2 - ingredient ?stove - appliance ?loc - location)
    :precondition (and
      (drained ?pan)
      (at ?ingredient1 ?loc)
      (at ?ingredient2 ?loc)
      (at-tool ?pan ?loc)
      (at-appliance ?stove ?loc)
      (has-power ?stove)
    )
    :effect (and
      (in-pan ?ingredient1 ?pan)
      (in-pan ?ingredient2 ?pan)
      (cooked ?ingredient1)
      (cooked ?ingredient2)
      (simmering ?pan)
      (heated ?pan)
      (not (at ?ingredient1 ?loc))
      (not (at ?ingredient2 ?loc))
    )
  )

  ;; 动作6：完成准备
  (:action finish_preparation
    :parameters (?pan - tool ?dish - dish ?ingredients - ingredient ?loc - location)
    :precondition (and
      (simmering ?pan)
      (at-tool ?pan ?loc)
      (at-dish ?dish ?loc)
      (forall (?i - ingredient)
        (in-pan ?i ?pan))
    )
    :effect (and
      (forall (?i - ingredient)
        (and
          (in-dish ?i ?dish)
          (not (in-pan ?i ?pan))
        ))
      (not (simmering ?pan))
      (clean ?pan)
      (not (heated ?pan))
    )
  )
)
