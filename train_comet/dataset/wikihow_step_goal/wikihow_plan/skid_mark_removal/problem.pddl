(define (problem remove_skid_marks)
  (:domain skid_mark_removal)

  (:objects
    you - agent
    eraser - tool
    linoleum_floor - surface
    faucet_water - water
  )

  (:init
    ;; 工具状态
    (tool_available eraser)

    ;; 位置状态
    (on_surface you linoleum_floor)

    ;; 滑痕状态
    (skid_mark_present linoleum_floor)

    ;; 地板初始状态（未清洁）
    ;; (floor_clean linoleum_floor) 不包含表示地板初始为不清洁

    ;; 水状态
    (water_available faucet_water)
  )

  (:goal
    (and
      ;; 滑痕已移除
      (skid_mark_removed linoleum_floor)

      ;; 地板已干燥
      (floor_dry linoleum_floor)
    )
  )
)
