(define (problem make_fairy_house)
  (:domain fairy_house_construction)

  (:objects
    ;;
    area1 - area

    ;;
    stick1 stick2 stick3 - stick

    ;;
    fairy_house1 - fairy_house
  )

  (:init
    ;;     ：      ，
    ;;   PDDL                ，
  )

  (:goal
    (and
      ;;
      (selected_area area1)

      ;;
      (collected stick1)
      (collected stick2)
      (collected stick3)

      ;;
      (bundled stick1)
      (bundled stick2)
      (bundled stick3)

      ;;
      (in_formation stick1)
      (in_formation stick2)
      (in_formation stick3)

      ;;
      (built_walls fairy_house1)

      ;;
      (tied_with_bark stick1)
      (tied_with_bark stick2)
      (tied_with_bark stick3)

      ;;
      (decorated fairy_house1)
    )
  )
)
