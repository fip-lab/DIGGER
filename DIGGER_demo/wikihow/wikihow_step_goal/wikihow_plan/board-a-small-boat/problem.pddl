(define (problem board-a-small-boat-problem)
  (:domain board-a-small-boat)

  (:objects
    passenger1 passenger2 - passenger
    platform1 - platform
    dock1 - dock
    boat1 - boat
  )

  (:init
    ;;
    (at passenger1 platform1)
    (at platform1 dock1)
    (at boat1 dock1)

    ;;
    (platform-present platform1)

    ;;
    (not (holding-rail passenger1))
    (not (legs-in-boat passenger1))
    (not (centered boat1))
    (not (crouched passenger1))
    (not (boat-stable boat1))
    (not (boat-moving boat1))

    ;;   2
    (not (at passenger2 boat1))
  )

  (:goal
    (and
      ;;   1
      (at passenger1 boat1)

      ;;
      (legs-in-boat passenger1)

      ;;
      (holding-rail passenger1)

      ;;
      (centered boat1)
      (boat-stable boat1)

      ;;   1
      (crouched passenger1)
    )
  )
)
