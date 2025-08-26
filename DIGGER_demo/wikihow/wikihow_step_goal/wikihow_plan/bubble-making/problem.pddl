(define (problem make_soap_bubbles)
  (:domain bubble-making-simple)

  (:objects
    ;;
    alice - person

    ;;
    wand1 - tool

    ;;
    soap1 water1 mixture1 - material

    ;;
    bowl1 - container

    ;;
    bubble1 - bubble

    ;;
    kitchen garden - location
  )

  (:init
    ;;
    (at_location alice kitchen)
    (at_location soap1 kitchen)
    (at_location water1 kitchen)
    (at_location bowl1 kitchen)
    (at_location wand1 kitchen)

    ;;
    (in soap1 bowl1)
    (in water1 bowl1)
    (not (mixed mixture1))
    (not (enhanced mixture1))
    (not (have_wand alice wand1))
    (not (in_air bubble1))
    (not (wet wand1))
    (not (outside alice))
    (not (served_bubble bubble1))
  )

  (:goal (and
    (in_air bubble1)
    (served_bubble bubble1)
    (wet wand1)
    (outside alice)
  ))
)
