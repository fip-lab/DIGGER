(define (problem make_cheese_sauce_problem)
  (:domain make_cheese_sauce)
  (:objects
    ; Entities
    velveeta stove_knob olives cheese cutting_board rotel_can peppers cheese_sauce pot - entity
  )
  (:init
    ; Velveeta initial state
    (has_granularity velveeta whole)
    (has_openness velveeta closed)
    (at_location velveeta in_package)
    (has_temperature velveeta cold)

    ; Cutting board initial state
    (has_cleanness cutting_board clean)
    (has_moisture cutting_board dry)
    (at_location cutting_board in_drawer)

    ; Stove knob initial state
    (has_power stove_knob off)
    (has_orientation stove_knob off_position)

    ; Pot initial state
    (has_cleanness pot clean)
    (at_location pot in_cupboard)
    (has_temperature pot cool)

    ; Rotel can initial state
    (has_openness rotel_can closed)
    (at_location rotel_can in_fridge)
    (has_temperature rotel_can cold)

    ; Peppers initial state
    (at_location peppers in_can)
    (has_temperature peppers cold)

    ; Olives initial state
    (at_location olives in_can)
    (has_temperature olives cold)

    ; Cheese sauce initial state
    (not (at_location cheese_sauce in_bowl))
    (at_location cheese_sauce in_pot)
    (has_temperature cheese_sauce hot)
  )
  (:goal
    (and
      (at_location cheese_sauce in_bowl)
      (has_temperature cheese_sauce hot)
      (at_location olives in_pot)
    )
  )
)
