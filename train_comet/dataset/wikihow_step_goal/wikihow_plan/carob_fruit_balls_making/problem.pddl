(define (problem make-carob-fruit-balls)
  (:domain carob_fruit_balls_making)

  (:objects
    ;; 人
    user1 - person
    ;; 工具
    spoon1 - tool
    ;; 容器
    mixing_bowl1 plate1 - container
    ;; 食材
    carob1 sugar1 oats1 peanut_butter1 - ingredient
    ;; 电器
    freezer1 - appliance
    ;; 位置
    kitchen_counter1 dining_table1 freezer_location - location
  )

  (:init
    ;; 拥有关系
    (owned user1 mixing_bowl1) (clean mixing_bowl1) (at mixing_bowl1 kitchen_counter1)
    (owned user1 spoon1) (clean spoon1) (at spoon1 kitchen_counter1)
    (owned user1 plate1) (clean plate1) (at plate1 dining_table1)
    (owned user1 freezer1) (clean freezer1) (at freezer1 kitchen_counter1)
    (owned user1 carob1) (clean carob1) (at carob1 kitchen_counter1)
    (owned user1 sugar1) (clean sugar1) (at sugar1 kitchen_counter1)
    (owned user1 oats1) (clean oats1) (at oats1 kitchen_counter1)
    (owned user1 peanut_butter1) (clean peanut_butter1) (at peanut_butter1 kitchen_counter1)
    ;; 初始状态
    (not (mixed mixing_bowl1))
    (not (rolled mixing_bowl1))
    (not (frozen mixing_bowl1))
    (not (served mixing_bowl1))
  )

  (:goal
    (and
      (served mixing_bowl1)
      (at mixing_bowl1 dining_table1)
    )
  )
)
