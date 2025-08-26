(define (problem make_asparagus_serrano)
  (:domain asparagus_serrano)

  (:objects
    ;;
    alice - person

    ;;
    cutting_board1 - tool

    ;;
    oven1 - appliance

    ;;
    tin1 dish1 - container

    ;;
    olive_oil1 asparagus1 serrano_ham1 - material

    ;;
    kitchen pantry fridge - location
  )

  (:init
    ;;
    (in olive_oil1 pantry)
    (in asparagus1 fridge)
    (in serrano_ham1 fridge)
    (at_location tin1 kitchen)
    (at_location dish1 kitchen)
    (at_location cutting_board1 kitchen)
    (at_location oven1 kitchen)

    ;;
    (clean cutting_board1)

    ;;
    (not (oven_preheated))
    (not (oven_on))

    ;;
    (not (in asparagus1 tin1))
    (not (wrapped_asparagus asparagus1 serrano_ham1))
    (not (prepared_asparagus asparagus1))
    (not (roasted_asparagus asparagus1))
    (not (served_asparagus asparagus1))
  )

  (:goal (and
    (served_asparagus asparagus1)
  ))
)
