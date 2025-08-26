(define (domain bike_riding)
  (:requirements :strips :typing)
  
  (:types
    agent
    bike_part
  )

  (:predicates
    ;; 知识相关谓词
    (has-knowledge-ability_to_identify_bike_shaft ?a - agent)
    (has-knowledge-ability_to_identify_handlebars ?a - agent)

    ;; 位置相关谓词
    (position-on-bike ?a - agent)
    (position-off-bike ?a - agent)

    ;; 脚踏板相关谓词
    (has-foot-on-pedal ?a - agent ?p - bike_part)

    ;; 动作状态相关谓词
    (has-motion-moving ?a - agent)
    (has-motion-still ?a - agent)

    ;; 平衡相关谓词
    (balance-maintained ?a - agent)

    ;; 抓握车把相关谓词
    (has-hold-handlebars ?a - agent)

    ;; 自行车运动状态相关谓词
    (motion-moving-bike ?bike - bike_part)
    (motion-stopped-bike ?bike - bike_part)

    ;; 刹车相关谓词
    (handbrakes-located ?bike - bike_part)
  )

  ;; 动作：挥动非主导腿跨越自行车
  (:action swing-leg-over-bike
    :parameters (?a - agent ?bike - bike_part)
    :precondition (and
      (not (has-knowledge-ability_to_identify_bike_shaft ?a))
      (position-off-bike ?a)
    )
    :effect (and
      (has-knowledge-ability_to_identify_bike_shaft ?a)
      (position-on-bike ?a)
    )
  )

  ;; 动作：将主导脚放在踏板上
  (:action put-foot-on-pedal
    :parameters (?a - agent ?p - bike_part)
    :precondition (and
      (position-on-bike ?a)
      (not (has-foot-on-pedal ?a ?p))
    )
    :effect (has-foot-on-pedal ?a ?p)
  )

  ;; 动作：抓握车把以获取支持
  (:action hold-handlebars-for-support
    :parameters (?a - agent ?bike - bike_part)
    :precondition (and
      (position-on-bike ?a)
      (not (has-hold-handlebars ?a))
    )
    :effect (has-hold-handlebars ?a)
  )

  ;; 动作：用脚踏动踏板
  (:action pedal-with-feet
    :parameters (?a - agent)
    :precondition (has-foot-on-pedal ?a pedals)
    :effect (and
      (has-motion-moving ?a)
      (motion-moving-bike bike)
      (balance-maintained ?a)
    )
  )

  ;; 动作：停止骑行
  (:action stop
    :parameters (?a - agent ?bike - bike_part)
    :precondition (has-motion-moving ?a)
    :effect (and
      (has-motion-still ?a)
      (motion-stopped-bike ?bike)
      (handbrakes-located ?bike)
    )
  )
)
