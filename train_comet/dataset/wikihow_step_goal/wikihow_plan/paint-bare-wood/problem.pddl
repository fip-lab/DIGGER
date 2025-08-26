(define (problem paint-bare-wood-problem)
  (:domain paint-bare-wood)

  (:objects
    ;; 人
    alice - person

    ;; 工具
    paintbrush1 - tool

    ;; 涂料
    oil_paint1 - material

    ;; 物体
    barewood1 - object
  )

  (:init
    ;; 初始状态
    (not (has_paint alice oil_paint1))
    (not (has_tool alice paintbrush1))

    (present barewood1)

    (clean paintbrush1)

    ;; 假设alice需要先获取工具和涂料
  )

  (:goal
    (and
      (finished_painting barewood1)
    )
  )
)
