(define (problem make-simple-inside-windshield-cleaner)
  (:domain windshield_cleaner)

  (:objects
    ;;
    user1 - person

    ;;
    eraser1 - tool

    ;;
    glovebox1 car_door_spot1 grease_container1 serving_bowl1 - container

    ;;
    windshield_inner1 - surface

    ;;
    store_location home_location car_location windshield_location - location
  )

  (:init
    ;;
    (at_location eraser1 store_location)
    (new eraser1)
    (has_money user1)
    (dirty windshield_inner1)

    ;;
    (at_location glovebox1 car_location)
    (at_location car_door_spot1 car_location)
    (at_location serving_bowl1 home_location)

    ;;
    ;;
  )

  (:goal
    (and
      (clean windshield_inner1)
      (owned user1 eraser1)
      (in_container eraser1 glovebox1)
      (clean_tool eraser1)
      (not (has_money user1))
    )
  )
)
