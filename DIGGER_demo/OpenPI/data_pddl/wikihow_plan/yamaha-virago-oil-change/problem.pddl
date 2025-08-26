(define (problem yamaha-virago-oil-change-problem)
  (:domain yamaha-virago-oil-change)

  (:objects
    ;;
    oil1 - oil
    old_oil1 - old_oil
    new_oil1 - new_oil

    ;;
    bung1 - bung
    oil_cap1 - oil_cap
    oil_filter1 - oil_filter
    funnel1 - funnel

    ;;
    bike1 - vehicle
    oil_tank1 - container
    can1 - can
    jug1 - jug
    bottle1 - bottle
  )

  (:init
    ;;
    (in oil1 bike1) ; oil1
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

    ;;
    (loose bung1)
    (away-from-bike bung1)
  )

  (:goal
    (and
    ;;
      (open oil_cap1)

      ;;
      (out oil_filter1)
      ;;
      (in old_oil1 jug1)
      (dirty funnel1)

      ;;
      (in new_oil1 oil_tank1)
      (full new_oil1)

      ;;
      (attached bung1)
    )
  )
)
