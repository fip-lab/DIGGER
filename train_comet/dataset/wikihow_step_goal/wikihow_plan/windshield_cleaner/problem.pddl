(define (problem make-simple-inside-windshield-cleaner)
  (:domain windshield_cleaner)

  (:objects
    ;; 人
    user1 - person

    ;; 工具
    eraser1 - tool

    ;; 容器
    glovebox1 car_door_spot1 grease_container1 serving_bowl1 - container

    ;; 表面
    windshield_inner1 - surface

    ;; 位置
    store_location home_location car_location windshield_location - location
  )

  (:init
    ;; 初始位置和状态
    (at_location eraser1 store_location)
    (new eraser1)
    (has_money user1)
    (dirty windshield_inner1)

    ;; 容器位置
    (at_location glovebox1 car_location)
    (at_location car_door_spot1 car_location)
    (at_location serving_bowl1 home_location)

    ;; 用户初始状态
    ;; 用户尚未拥有擦子
  )

  (:goal
    (and
      (clean windshield_inner1)
      (owned user1 eraser1)
      (in_container eraser1 glovebox1)
      (clean_tool eraser1)
      (not (has_money user1))
    )
  )
)
