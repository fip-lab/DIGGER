(define (problem make_fairy_house)
  (:domain fairy_house_construction)

  (:objects
    ;; 区域
    area1 - area

    ;; 棍子
    stick1 stick2 stick3 - stick

    ;; 仙女屋
    fairy_house1 - fairy_house
  )

  (:init
    ;; 初始状态：所有对象存在，但没有任何谓词成立
    ;; 因为PDDL中的初始状态默认只有显式声明为真，其他为假
  )

  (:goal
    (and
      ;; 选择了区域
      (selected_area area1)

      ;; 收集了所有棍子
      (collected stick1)
      (collected stick2)
      (collected stick3)

      ;; 捆绑了所有棍子
      (bundled stick1)
      (bundled stick2)
      (bundled stick3)

      ;; 所有棍子已在结构中
      (in_formation stick1)
      (in_formation stick2)
      (in_formation stick3)

      ;; 仙女屋的墙壁已建造
      (built_walls fairy_house1)

      ;; 所有棍子已用树皮装饰
      (tied_with_bark stick1)
      (tied_with_bark stick2)
      (tied_with_bark stick3)

      ;; 仙女屋已装饰完成
      (decorated fairy_house1)
    )
  )
)
