(define (problem grow_dwarf_balsam_fir_problem)
  (:domain grow_dwarf_balsam_fir)

  (:objects
    fir1 - plant
    container1 container2 - container
    soil1 - soil
    nursery garden_center home - location
  )

  (:init
    ;;
    (available_plant_at fir1 nursery)
    (available_container_at container1 garden_center)
    (available_container_at container2 garden_center)
    (available_soil_at soil1 garden_center)

    ;;
    (clean container1)
    (clean container2)
    (empty container1)
    (empty container2)

    ;;
    (not (planted_in fir1 container1))

    ;;
    (not (watered fir1))
    (not (established fir1))
    ;;
    (needs_repotting fir1)
  )

  (:goal
    (and
      ;;
      (planted_in fir1 container2)

      ;;
      (dirty container1)
      (clean container2)

      ;;
      (watered fir1)
      (established fir1)

    )
  )
)
