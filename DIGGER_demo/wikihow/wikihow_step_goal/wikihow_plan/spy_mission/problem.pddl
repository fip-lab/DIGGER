(define (problem spy_mission_problem)
  (:domain spy_mission)

  (:objects
    ;;
    you co_conspirator1 co_conspirator2 - person

    ;;
    binoculars camera - gear

    ;;
    safehouse - location

    ;;
    target_victim - victim
  )

  (:init
    ;;     ：           ，
    (member-of-group you)
    (member-of-group co_conspirator1)
    (member-of-group co_conspirator2)

    ;;     ：     ，     ，
    ;;         ，       :init
  )

  (:goal
    (and
      ;;
      (group-formed)

      ;;
      (location-set safehouse)

      ;;
      (has-gear you binoculars)
      (has-gear you camera)
      (has-gear co_conspirator1 binoculars)
      (has-gear co_conspirator1 camera)
      (has-gear co_conspirator2 binoculars)
      (has-gear co_conspirator2 camera)

      ;;
      (victim-identified target_victim)
    )
  )
)
