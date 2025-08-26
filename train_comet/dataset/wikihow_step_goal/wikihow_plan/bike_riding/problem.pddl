(define (problem bike_task)
  (:domain bike_riding)

  (:objects
    you - agent
    pedals chain handlebars grip_on_bike handbrakes bike - bike_part
  )

  (:init
    ;; 知识状态
    (not (has-knowledge-ability_to_identify_bike_shaft you))
    (not (has-knowledge-ability_to_identify_handlebars you))

    ;; 位置状态
    (position-off-bike you)

    ;; 脚踏板状态
    (not (has-foot-on-pedal you pedals))

    ;; 动作状态
    (has-motion-still you)

    ;; 平衡状态
    (not (balance-maintained you))

    ;; 抓握车把状态
    (not (has-hold-handlebars you))

    ;; 自行车运动状态
    (motion-stopped-bike bike)

    ;; 刹车状态
    (not (handbrakes-located bike))
  )

  (:goal
    (and
      (has-motion-still you)
      (motion-stopped-bike bike)
      (handbrakes-located bike)
    )
  )
)
