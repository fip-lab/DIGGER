(define (problem make-taco-filling)
  (:domain taco-filling)

  (:objects
    ;; 食材
    beef1 onion1 tomato1 spice1 - ingredient

    ;; 工具
    pan1 - tool

    ;; 电器
    stove1 - appliance

    ;; 容器
    serving_dish1 - dish

    ;; 位置
    kitchen_counter sink_location - location
  )

  (:init
    ;; 食材的初始位置
    (at beef1 kitchen_counter)
    (at onion1 kitchen_counter)
    (at tomato1 kitchen_counter)
    (at spice1 kitchen_counter)

    ;; 工具的初始位置
    (at-tool pan1 kitchen_counter)

    ;; 电器的初始状态
    (at-appliance stove1 kitchen_counter)
    (has-power stove1)

    ;; 容器的初始位置
    (at-dish serving_dish1 kitchen_counter)

    ;; 煎锅的初始状态
    (clean pan1)
    (not (heated pan1))
    (not (simmering pan1))
    (not (drained pan1))

    ;; 食材的初始状态
    (not (cooked beef1))
    (not (cooked onion1))
    (not (cooked tomato1))
    (not (cooked spice1))

    ;; 食材不在煎锅中
    (not (in-pan beef1 pan1))
    (not (in-pan onion1 pan1))
    (not (in-pan tomato1 pan1))
    (not (in-pan spice1 pan1))
  )

  (:goal
    (and
      ;; 所有食材已煮熟并在餐盘中
      (cooked beef1)
      (cooked onion1)
      (cooked tomato1)
      (cooked spice1)

      (in-dish beef1 serving_dish1)
      (in-dish onion1 serving_dish1)
      (in-dish tomato1 serving_dish1)
      (in-dish spice1 serving_dish1)

      ;; 煎锅已清洁
      (clean pan1)
      (not (heated pan1))
      (not (simmering pan1))

      ;; 脂肪已排出
      (drained pan1)
    )
  )
)
