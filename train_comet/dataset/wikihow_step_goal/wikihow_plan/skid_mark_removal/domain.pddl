(define (domain skid_mark_removal)
  (:requirements :strips :typing)

  (:types
    agent
    tool
    surface
    water
  )

  (:predicates
    ;; 工具状态
    (has_tool ?a - agent ?t - tool)
    (tool_available ?t - tool)
    (tool_dirty ?t - tool)

    ;; 位置状态
    (on_surface ?a - agent ?s - surface)

    ;; 滑痕状态
    (skid_mark_present ?s - surface)
    (skid_mark_removed ?s - surface)

    ;; 地板状态
    (floor_clean ?s - surface)
    (floor_dry ?s - surface)

    ;; 人体状态
    (kneeling ?a - agent)

    ;; 水状态
    (water_available ?w - water)
  )

  ;; 获取橡皮擦
  (:action obtain_eraser
    :parameters (?a - agent ?t - tool)
    :precondition (tool_available ?t)
    :effect (and
              (has_tool ?a ?t)
              (not (tool_available ?t))
            )
  )

  ;; 蹲下并擦拭
  (:action kneel_and_rub
    :parameters (?a - agent ?t - tool ?s - surface)
    :precondition (and
                    (has_tool ?a ?t)
                    (on_surface ?a ?s)
                    (skid_mark_present ?s)
                    (not (tool_dirty ?t))
                  )
    :effect (and
              (kneeling ?a)
              (skid_mark_removed ?s)
              (floor_clean ?s)
              (tool_dirty ?t)
            )
  )

  ;; 清洗并擦干
  (:action wash_and_dry
    :parameters (?a - agent ?s - surface ?w - water)
    :precondition (and
                    (floor_clean ?s)
                    (water_available ?w)
                  )
    :effect (and
              (floor_dry ?s)
            )
  )
)
