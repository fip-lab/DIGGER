(define (problem make-pancake-mix-container)
  (:domain pancake_mix_container)

  (:objects
    ;; 人
    user1 - person

    ;; 工具
    scrubber1 - tool
    funnel1 - tool
    lid1 - tool
    label1 - tool
    pen1 - tool

    ;; 容器
    ketchup_bottle1 - container

    ;; 食材
    pancake_batter1 - ingredient

    ;; 表面
    sink1 - surface

    ;; 电器
    fridge1 - appliance

    ;; 位置
    store_location home_location fridge_location kitchen_counter - location
  )

  (:init
    ;; 拥有关系
    (owned user1 ketchup_bottle1)
    (owned user1 scrubber1)
    (owned user1 funnel1)
    (owned user1 lid1)
    (owned user1 label1)
    (owned user1 pen1)
    (owned user1 pancake_batter1)
    (owned user1 fridge1)

    ;; 初始位置
    (at ketchup_bottle1 store_location)
    (at scrubber1 kitchen_counter)
    (at funnel1 kitchen_counter)
    (at lid1 kitchen_counter)
    (at label1 kitchen_counter)
    (at pen1 kitchen_counter)
    (at pancake_batter1 home_location)
    (at fridge1 home_location)
    (at sink1 home_location)

    ;; 状态
    (dirty ketchup_bottle1)
    (clean scrubber1)
    (clean funnel1)
    (clean ketchup_bottle1) ; Assuming it's already cleaned
    (not (funnel_attached funnel1 ketchup_bottle1))
    (not (has_batter ketchup_bottle1))
    (not (sealed ketchup_bottle1))
    (not (labeled ketchup_bottle1))
    (clean fridge1)
  )

  (:goal
    (and
      (in_fridge ketchup_bottle1)
      (sealed ketchup_bottle1)
      (labeled ketchup_bottle1)
    )
  )
)
