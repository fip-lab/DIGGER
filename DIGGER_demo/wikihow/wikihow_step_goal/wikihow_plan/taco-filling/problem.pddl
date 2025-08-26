(define (problem make-taco-filling)
  (:domain taco-filling)

  (:objects
    ;;
    beef1 onion1 tomato1 spice1 - ingredient

    ;;
    pan1 - tool

    ;;
    stove1 - appliance

    ;;
    serving_dish1 - dish

    ;;
    kitchen_counter sink_location - location
  )

  (:init
    ;;
    (at beef1 kitchen_counter)
    (at onion1 kitchen_counter)
    (at tomato1 kitchen_counter)
    (at spice1 kitchen_counter)

    ;;
    (at-tool pan1 kitchen_counter)

    ;;
    (at-appliance stove1 kitchen_counter)
    (has-power stove1)

    ;;
    (at-dish serving_dish1 kitchen_counter)

    ;;
    (clean pan1)
    (not (heated pan1))
    (not (simmering pan1))
    (not (drained pan1))

    ;;
    (not (cooked beef1))
    (not (cooked onion1))
    (not (cooked tomato1))
    (not (cooked spice1))

    ;;
    (not (in-pan beef1 pan1))
    (not (in-pan onion1 pan1))
    (not (in-pan tomato1 pan1))
    (not (in-pan spice1 pan1))
  )

  (:goal
    (and
      ;;
      (cooked beef1)
      (cooked onion1)
      (cooked tomato1)
      (cooked spice1)

      (in-dish beef1 serving_dish1)
      (in-dish onion1 serving_dish1)
      (in-dish tomato1 serving_dish1)
      (in-dish spice1 serving_dish1)

      ;;
      (clean pan1)
      (not (heated pan1))
      (not (simmering pan1))

      ;;
      (drained pan1)
    )
  )
)
