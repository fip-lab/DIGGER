(define (problem MakePotatoRibbons_problem)
  (:domain MakePotatoRibbons)

  (:objects
    ;; 食材
    potato1 potato2 - ingredient

    ;; 工具
    peeler1 - utensil
    pan1 - utensil
    sink1 - utensil
    cloth1 - utensil

    ;; 电器
    stove1 - appliance

    ;; 位置
    kitchen_counter kitchen_sink dining_table kitchen_stove - location

    ;; 餐具
    dish1 - dish
  )

  (:init
    ;; 食材的位置
    (at potato1 kitchen_counter)
    (at potato2 kitchen_counter)

    ;; 工具的位置
    (at peeler1 kitchen_counter)
    (at pan1 kitchen_stove)
    (at sink1 kitchen_sink)
    (at cloth1 kitchen_counter)

    ;; 电器的位置和状态
    (at stove1 kitchen_stove)
    (heated stove1)
    (has_oil stove1)

    ;; 容器和餐具的状态
    (clean peeler1)
    (clean pan1)
    (clean sink1)
    (clean cloth1)
    (at dish1 dining_table)

    ;; 食材的初始状态
    (not (washed potato1))
    (not (peeled potato1))
    (not (cut potato1))
    (not (drained potato1))
    (not (fried potato1))

    (not (washed potato2))
    (not (peeled potato2))
    (not (cut potato2))
    (not (drained potato2))
    (not (fried potato2))
  )

  (:goal
    (and
      ;; 所有土豆已被炸制并上菜
      (in_dish potato1 dish1)
      (in_dish potato2 dish1)
    )
  )
)
