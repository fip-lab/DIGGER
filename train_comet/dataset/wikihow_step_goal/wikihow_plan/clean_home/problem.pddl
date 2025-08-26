(define (problem clean_home_problem)
  (:domain clean_home)

  (:objects
    ;; 房间
    living_room kitchen bathroom - room

    ;; 地毯
    rug1 rug2 - rug

    ;; 垃圾桶
    basket1 basket2 - basket

    ;; 物品
    item1 item2 - item

    ;; 表面
    TV window1 window2 - surface

    ;; 清洁工具
    cleaner1 - cleaner

    ;; 垃圾袋
    trash_bag1 trash_bag2 - dish
  )

  (:init
    ;; 初始位置和状态
    (stray_item item1)
    (stray_item item2)

    (empty basket1)
    (empty basket2)

    (dusty living_room)
    (dusty kitchen)
    (dusty bathroom)

    (dirty_rug rug1)
    (dirty_rug rug2)

    (dirty_surface TV)
    (dirty_surface window1)
    (dirty_surface window2)

    ;; 垃圾袋初始为空
    (empty trash_bag1)
    (empty trash_bag2)
  )

  (:goal
    (and
      ;; 房间清洁状态
      (cleaned_room living_room)
      (cleaned_room kitchen)
      (cleaned_room bathroom)

      ;; 地毯清洁状态
      (cleaned_rug rug1)
      (cleaned_rug rug2)

      ;; 表面清洁状态
      (cleaned_surface TV)
      (cleaned_surface window1)
      (cleaned_surface window2)

      ;; 垃圾处理状态
      (trash_disposed trash_bag1)
      (trash_disposed trash_bag2)

      ;; 物品整理状态
      (organized item1)
      (organized item2)
    )
  )
)
