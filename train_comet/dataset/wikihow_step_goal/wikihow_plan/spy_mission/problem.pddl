(define (problem spy_mission_problem)
  (:domain spy_mission)

  (:objects
    ;; 人员
    you co_conspirator1 co_conspirator2 - person

    ;; 装备
    binoculars camera - gear

    ;; 地点
    safehouse - location

    ;; 受害者
    target_victim - victim
  )

  (:init
    ;; 初始状态：所有人员属于间谍组成员，但组尚未形成
    (member-of-group you)
    (member-of-group co_conspirator1)
    (member-of-group co_conspirator2)

    ;; 初始状态：地点未设置，装备未收集，受害者未识别
    ;; 这些状态默认为假，因此不需要在 :init 中声明
  )

  (:goal
    (and
      ;; 间谍组已形成
      (group-formed)

      ;; 间谍基地地点已设置
      (location-set safehouse)

      ;; 所有人已收集所有装备
      (has-gear you binoculars)
      (has-gear you camera)
      (has-gear co_conspirator1 binoculars)
      (has-gear co_conspirator1 camera)
      (has-gear co_conspirator2 binoculars)
      (has-gear co_conspirator2 camera)

      ;; 受害者已被识别
      (victim-identified target_victim)
    )
  )
)
