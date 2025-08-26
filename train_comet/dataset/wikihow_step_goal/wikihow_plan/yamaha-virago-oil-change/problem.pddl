(define (problem yamaha-virago-oil-change-problem)
  (:domain yamaha-virago-oil-change)

  (:objects
    ;; 液体
    oil1 - oil
    old_oil1 - old_oil
    new_oil1 - new_oil

    ;; 工具
    bung1 - bung
    oil_cap1 - oil_cap
    oil_filter1 - oil_filter
    funnel1 - funnel

    ;; 容器
    bike1 - vehicle
    oil_tank1 - container
    can1 - can
    jug1 - jug
    bottle1 - bottle
  )

  (:init
    ;; 初始状态
    (in oil1 bike1) ; oil1 在摩托车上
    (attached bung1)
    (full bung1)
    (on oil_cap1 oil_tank1)
    (closed oil_cap1)
    (in_filter oil_filter1)
    (full oil1)
    (clean funnel1)
    (in old_oil1 can1)
    (empty new_oil1)
    (in new_oil1 bottle1)

    ;; 其他初始状态
    (loose bung1)
    (away-from-bike bung1)
  )

  (:goal
    (and
    ;; 油盖已打开
      (open oil_cap1)

      ;; 油滤器已移除
      (out oil_filter1)
      ;; 回收旧油
      (in old_oil1 jug1)
      (dirty funnel1)

      ;; 新油已添加到油箱
      (in new_oil1 oil_tank1)
      (full new_oil1)

      ;; 油塞已重新安装
      (attached bung1)
    )
  )
)
