(define (problem make_asparagus_serrano)
  (:domain asparagus_serrano)

  (:objects
    ;; 人
    alice - person

    ;; 工具
    cutting_board1 - tool

    ;; 设备
    oven1 - appliance

    ;; 容器
    tin1 dish1 - container

    ;; 材料
    olive_oil1 asparagus1 serrano_ham1 - material

    ;; 位置
    kitchen pantry fridge - location
  )

  (:init
    ;; 初始位置
    (in olive_oil1 pantry)
    (in asparagus1 fridge)
    (in serrano_ham1 fridge)
    (at_location tin1 kitchen)
    (at_location dish1 kitchen)
    (at_location cutting_board1 kitchen)
    (at_location oven1 kitchen)

    ;; 工具状态
    (clean cutting_board1)

    ;; 设备状态
    (not (oven_preheated))
    (not (oven_on))

    ;; 材料未被使用
    (not (in asparagus1 tin1))
    (not (wrapped_asparagus asparagus1 serrano_ham1))
    (not (prepared_asparagus asparagus1))
    (not (roasted_asparagus asparagus1))
    (not (served_asparagus asparagus1))
  )

  (:goal (and
    (served_asparagus asparagus1)
  ))
)
