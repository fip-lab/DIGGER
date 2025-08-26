(define (problem remove_skid_marks)
  (:domain skid_mark_removal)

  (:objects
    you - agent
    eraser - tool
    linoleum_floor - surface
    faucet_water - water
  )

  (:init
    ;;
    (tool_available eraser)

    ;;
    (on_surface you linoleum_floor)

    ;;
    (skid_mark_present linoleum_floor)

    ;;       （   ）
    ;; (floor_clean linoleum_floor)

    ;;
    (water_available faucet_water)
  )

  (:goal
    (and
      ;;
      (skid_mark_removed linoleum_floor)

      ;;
      (floor_dry linoleum_floor)
    )
  )
)
