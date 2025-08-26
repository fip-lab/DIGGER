(define (domain pancake_mix_container)
  (:requirements :strips :typing)

  (:types
    person tool container ingredient surface appliance location - object
  )

  (:predicates
    ;; 拥有关系
    (owned ?p - person ?obj - object)

    ;; 位置关系
    (at ?obj - object ?loc - location)
    (in ?obj - object ?container - container)
    (on_surface ?obj - object ?s - surface)

    ;; 状态相关
    (clean ?obj - object)
    (dirty ?obj - object)
    (wet ?obj - object)
    (sealed ?container - container)
    (labeled ?container - container)
    (funnel_attached ?funnel - tool ?container - container)
    (has_batter ?container - container)
    (in_fridge ?container - container)
    (used ?tool - tool)
    (not_at ?obj - object ?loc - location)
  )

  ;; 动作1：擦洗瓶子
  (:action scrub_bottle
    :parameters (?p - person ?bottle - container ?scrubber - tool ?sink - surface)
    :precondition (and
      (owned ?p ?bottle)
      (owned ?p ?scrubber)
      (at ?bottle ?sink)
      (dirty ?bottle)
      (clean ?scrubber)
    )
    :effect (and
      (clean ?bottle)
      (dirty ?scrubber)
      (wet ?scrubber)
    )
  )

  ;; 动作2：将漏斗放在瓶口上
  (:action attach_funnel
    :parameters (?p - person ?funnel - tool ?bottle - container)
    :precondition (and
      (owned ?p ?funnel)
      (owned ?p ?bottle)
      (clean ?funnel)
      (clean ?bottle)
      (not (funnel_attached ?funnel ?bottle))
    )
    :effect (funnel_attached ?funnel ?bottle)
  )

  ;; 动作3：通过漏斗倒入煎饼面糊
  (:action pour_batter
    :parameters (?p - person ?batter - ingredient ?funnel - tool ?bottle - container)
    :precondition (and
      (owned ?p ?batter)
      (owned ?p ?funnel)
      (owned ?p ?bottle)
      (funnel_attached ?funnel ?bottle)
      (clean ?bottle)
      (not (has_batter ?bottle))
    )
    :effect (and
      (has_batter ?bottle)
      (dirty ?funnel)
      (not (has_batter ?bottle)) ; Assuming batter is poured completely
    )
  )

  ;; 动作4：更换盖子并标记瓶子
  (:action replace_lid_and_label
    :parameters (?p - person ?bottle - container ?lid - tool ?label - tool ?pen - tool)
    :precondition (and
      (owned ?p ?bottle)
      (owned ?p ?lid)
      (owned ?p ?label)
      (owned ?p ?pen)
      (has_batter ?bottle)
      (not (sealed ?bottle))
    )
    :effect (and
      (sealed ?bottle)
      (labeled ?bottle)
      (used ?lid)
      (used ?label)
      (used ?pen)
    )
  )

  ;; 动作5：将瓶子放入冰箱
  (:action place_in_fridge
    :parameters (?p - person ?bottle - container ?fridge - appliance ?loc_fridge - location)
    :precondition (and
      (owned ?p ?bottle)
      (owned ?p ?fridge)
      (sealed ?bottle)
      (at ?bottle ?loc_fridge)
      (clean ?fridge)
    )
    :effect (and
      (in_fridge ?bottle)
      (not (at ?bottle ?loc_fridge))
    )
  )
)

