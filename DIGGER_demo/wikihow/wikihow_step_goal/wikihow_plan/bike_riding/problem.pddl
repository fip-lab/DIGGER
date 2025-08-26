(define (problem bike_task)
  (:domain bike_riding)

  (:objects
    you - agent
    pedals chain handlebars grip_on_bike handbrakes bike - bike_part
  )

  (:init
    ;;
    (not (has-knowledge-ability_to_identify_bike_shaft you))
    (not (has-knowledge-ability_to_identify_handlebars you))

    ;;
    (position-off-bike you)

    ;;
    (not (has-foot-on-pedal you pedals))

    ;;
    (has-motion-still you)

    ;;
    (not (balance-maintained you))

    ;;
    (not (has-hold-handlebars you))

    ;;
    (motion-stopped-bike bike)

    ;;
    (not (handbrakes-located bike))
  )

  (:goal
    (and
      (has-motion-still you)
      (motion-stopped-bike bike)
      (handbrakes-located bike)
    )
  )
)
