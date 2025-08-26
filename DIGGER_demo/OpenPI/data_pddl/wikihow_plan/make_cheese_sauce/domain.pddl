(define (domain make_cheese_sauce)
  (:requirements :strips :typing)
  (:types
    entity
    granularity
    location
    temperature
    openness
    texture
    power
    orientation
    cleanness
    moisture
    taste
  )

  (:constants
    ; Granularity Values
    whole cubed liquid solid chopped - granularity

    ; Location Values
    in_package on_counter in_fridge in_pot on_cutting_board in_sauce_pan in_bowl
    in_can to_the_side in_pan in_drawer on_stove in_cupboard in_sink - location

    ; Temperature Values
    cold cool room_temperature hot warming - temperature

    ; Openness Values
    open closed - openness

    ; Texture Values
    thick runny - texture

    ; Power Values
    on off - power

    ; Orientation Values
    on_position off_position medium_low low - orientation

    ; Cleanness Values
    clean dirty - cleanness

    ; Moisture Values
    dry wet - moisture

    ; Taste Values
    mild spicy - taste
  )

  (:predicates
    (has_granularity ?entity - entity ?value - granularity)
    (at_location ?entity - entity ?value - location)
    (has_temperature ?entity - entity ?value - temperature)
    (has_openness ?entity - entity ?value - openness)
    (has_texture ?entity - entity ?value - texture)
    (has_power ?entity - entity ?value - power)
    (has_orientation ?entity - entity ?value - orientation)
    (has_cleanness ?entity - entity ?value - cleanness)
    (has_moisture ?entity - entity ?value - moisture)
    (has_taste ?entity - entity ?value - taste)
  )

  ; Action for Step 1
  (:action cut_velveeta
    :parameters (?velveeta - entity ?cutting_board - entity)
    :precondition (and
      (has_granularity ?velveeta whole)
      (has_openness ?velveeta closed)
      (at_location ?velveeta in_package)
      (has_cleanness ?cutting_board clean)
      (has_moisture ?cutting_board dry)
    )
    :effect (and
      (not (has_granularity ?velveeta whole))
      (has_granularity ?velveeta cubed)
      (not (has_openness ?velveeta closed))
      (has_openness ?velveeta open)
      (not (at_location ?velveeta in_package))
      (at_location ?velveeta on_cutting_board)
      (not (has_cleanness ?cutting_board clean))
      (has_cleanness ?cutting_board dirty)
      (not (has_moisture ?cutting_board dry))
      (has_moisture ?cutting_board wet)
    )
  )

  ; Action for Step 2
  (:action set_burner_add_cheese
    :parameters (?stove - entity ?velveeta - entity ?pot - entity)
    :precondition (and
      (has_power ?stove off)
      (has_orientation ?stove off_position)
      (has_granularity ?velveeta cubed)
      (at_location ?velveeta on_cutting_board)
      (at_location ?pot in_cupboard)
    )
    :effect (and
      (not (has_power ?stove off))
      (has_power ?stove on)
      (not (has_orientation ?stove off_position))
      (has_orientation ?stove medium_low)
      (not (at_location ?velveeta on_cutting_board))
      (at_location ?velveeta in_pot)
      (not (at_location ?pot in_cupboard))
      (at_location ?pot on_stove)
    )
  )

  ; Action for Step 3
  (:action melt_cheese_add_tomatoes
    :parameters (?velveeta - entity ?stove - entity ?rotel_can - entity)
    :precondition (and
      (has_granularity ?velveeta cubed)
      (has_power ?stove on)
      (has_orientation ?stove medium_low)
      (at_location ?velveeta in_pot)
      (has_openness ?rotel_can closed)
      (at_location ?rotel_can in_fridge)
    )
    :effect (and
      (not (has_granularity ?velveeta cubed))
      (has_granularity ?velveeta liquid)
      (not (has_temperature ?velveeta room_temperature))
      (has_temperature ?velveeta hot)
      (has_texture ?velveeta runny)
      (not (has_orientation ?stove medium_low))
      (has_orientation ?stove low)
      (not (has_openness ?rotel_can closed))
      (has_openness ?rotel_can open)
      (not (at_location ?rotel_can in_fridge))
      (at_location ?rotel_can in_pot)
    )
  )

  ; Action for Step 4
  (:action add_peppers_and_olives
    :parameters (?peppers - entity ?olives - entity ?pot - entity)
    :precondition (and
      (at_location ?peppers in_can)
      (at_location ?olives in_can)
      (at_location ?pot on_stove)
    )
    :effect (and
      (not (at_location ?peppers in_can))
      (at_location ?peppers in_pot)
      (not (at_location ?olives in_can))
      (at_location ?olives in_pot)
    )
  )

  ; Action for Step 5
  (:action serve_cheese_sauce
    :parameters (?cheese_sauce - entity ?pot - entity)
    :precondition (and
      (at_location ?cheese_sauce in_pot)
      (has_temperature ?cheese_sauce hot)
      (at_location ?pot on_stove)
    )
    :effect (and
      (not (at_location ?cheese_sauce in_pot))
      (at_location ?cheese_sauce in_bowl)
      (not (at_location ?pot on_stove))
      (at_location ?pot in_sink)
    )
  )
)
