(define (problem MakePotatoRibbons_problem)
  (:domain MakePotatoRibbons)

  (:objects
    ;;
    potato1 potato2 - ingredient

    ;;
    peeler1 - utensil
    pan1 - utensil
    sink1 - utensil
    cloth1 - utensil

    ;;
    stove1 - appliance

    ;;
    kitchen_counter kitchen_sink dining_table kitchen_stove - location

    ;;
    dish1 - dish
  )

  (:init
    ;;
    (at potato1 kitchen_counter)
    (at potato2 kitchen_counter)

    ;;
    (at peeler1 kitchen_counter)
    (at pan1 kitchen_stove)
    (at sink1 kitchen_sink)
    (at cloth1 kitchen_counter)

    ;;
    (at stove1 kitchen_stove)
    (heated stove1)
    (has_oil stove1)

    ;;
    (clean peeler1)
    (clean pan1)
    (clean sink1)
    (clean cloth1)
    (at dish1 dining_table)

    ;;
    (not (washed potato1))
    (not (peeled potato1))
    (not (cut potato1))
    (not (drained potato1))
    (not (fried potato1))

    (not (washed potato2))
    (not (peeled potato2))
    (not (cut potato2))
    (not (drained potato2))
    (not (fried potato2))
  )

  (:goal
    (and
      ;;
      (in_dish potato1 dish1)
      (in_dish potato2 dish1)
    )
  )
)
