(define (problem clean_home_problem)
  (:domain clean_home)

  (:objects
    ;;
    living_room kitchen bathroom - room

    ;;
    rug1 rug2 - rug

    ;;
    basket1 basket2 - basket

    ;;
    item1 item2 - item

    ;;
    TV window1 window2 - surface

    ;;
    cleaner1 - cleaner

    ;;
    trash_bag1 trash_bag2 - dish
  )

  (:init
    ;;
    (stray_item item1)
    (stray_item item2)

    (empty basket1)
    (empty basket2)

    (dusty living_room)
    (dusty kitchen)
    (dusty bathroom)

    (dirty_rug rug1)
    (dirty_rug rug2)

    (dirty_surface TV)
    (dirty_surface window1)
    (dirty_surface window2)

    ;;
    (empty trash_bag1)
    (empty trash_bag2)
  )

  (:goal
    (and
      ;;
      (cleaned_room living_room)
      (cleaned_room kitchen)
      (cleaned_room bathroom)

      ;;
      (cleaned_rug rug1)
      (cleaned_rug rug2)

      ;;
      (cleaned_surface TV)
      (cleaned_surface window1)
      (cleaned_surface window2)

      ;;
      (trash_disposed trash_bag1)
      (trash_disposed trash_bag2)

      ;;
      (organized item1)
      (organized item2)
    )
  )
)
