(define (problem grow_dwarf_balsam_fir_problem)
  (:domain grow_dwarf_balsam_fir)

  (:objects
    fir1 - plant
    container1 container2 - container
    soil1 - soil
    nursery garden_center home - location
  )

  (:init
    ;; 可用性
    (available_plant_at fir1 nursery)
    (available_container_at container1 garden_center)
    (available_container_at container2 garden_center)
    (available_soil_at soil1 garden_center)

    ;; 容器初始状态
    (clean container1)
    (clean container2)
    (empty container1)
    (empty container2)

    ;; 植物初始状态
    (not (planted_in fir1 container1))

    ;; 植物养护初始状态
    (not (watered fir1))
    (not (established fir1))
    ;; 需要移栽
    (needs_repotting fir1)
  )

  (:goal
    (and
      ;; 植物已种植在新的容器中
      (planted_in fir1 container2)

      ;; 新容器状态
      (dirty container1)
      (clean container2)

      ;; 植物已浇水并确立
      (watered fir1)
      (established fir1)

    )
  )
)
