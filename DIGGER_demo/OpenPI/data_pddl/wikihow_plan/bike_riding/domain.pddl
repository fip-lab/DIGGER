(define (domain bike_riding)
  (:requirements :strips :typing)
  
  (:types
    agent
    bike_part
  )

  (:predicates
    ;;
    (has-knowledge-ability_to_identify_bike_shaft ?a - agent)
    (has-knowledge-ability_to_identify_handlebars ?a - agent)

    ;;
    (position-on-bike ?a - agent)
    (position-off-bike ?a - agent)

    ;;
    (has-foot-on-pedal ?a - agent ?p - bike_part)

    ;;
    (has-motion-moving ?a - agent)
    (has-motion-still ?a - agent)

    ;;
    (balance-maintained ?a - agent)

    ;;
    (has-hold-handlebars ?a - agent)

    ;;
    (motion-moving-bike ?bike - bike_part)
    (motion-stopped-bike ?bike - bike_part)

    ;;
    (handbrakes-located ?bike - bike_part)
  )

  ;;   ：
  (:action swing-leg-over-bike
    :parameters (?a - agent ?bike - bike_part)
    :precondition (and
      (not (has-knowledge-ability_to_identify_bike_shaft ?a))
      (position-off-bike ?a)
    )
    :effect (and
      (has-knowledge-ability_to_identify_bike_shaft ?a)
      (position-on-bike ?a)
    )
  )

  ;;   ：
  (:action put-foot-on-pedal
    :parameters (?a - agent ?p - bike_part)
    :precondition (and
      (position-on-bike ?a)
      (not (has-foot-on-pedal ?a ?p))
    )
    :effect (has-foot-on-pedal ?a ?p)
  )

  ;;   ：
  (:action hold-handlebars-for-support
    :parameters (?a - agent ?bike - bike_part)
    :precondition (and
      (position-on-bike ?a)
      (not (has-hold-handlebars ?a))
    )
    :effect (has-hold-handlebars ?a)
  )

  ;;   ：
  (:action pedal-with-feet
    :parameters (?a - agent)
    :precondition (has-foot-on-pedal ?a pedals)
    :effect (and
      (has-motion-moving ?a)
      (motion-moving-bike bike)
      (balance-maintained ?a)
    )
  )

  ;;   ：
  (:action stop
    :parameters (?a - agent ?bike - bike_part)
    :precondition (has-motion-moving ?a)
    :effect (and
      (has-motion-still ?a)
      (motion-stopped-bike ?bike)
      (handbrakes-located ?bike)
    )
  )
)
