(define (domain marshmallow_dip)
  (:requirements :strips :typing)
  (:types
    ingredient container appliance
  )

  (:predicates
    ; Ingredient states
    (separate ?i1 - ingredient ?i2 - ingredient)
    (combined ?i1 - ingredient ?i2 - ingredient)
    (in_container ?i - ingredient ?c - container)
    (whole ?i - ingredient)
    (sliced ?i - ingredient)

    ; Container states
    (clean ?c - container)
    (dirty ?c - container)
    (empty ?c - container)
    (full ?c - container)

    ; Appliance states
    (turned_on ?a - appliance)
    (turned_off ?a - appliance)
    (clean_appliance ?a - appliance)
    (dirty_appliance ?a - appliance)
  )

  ; Action 1: Blend cream cheese and marshmallow cream until combined
  (:action blend_ingredients
    :parameters (?cream_cheese - ingredient ?marshmallow_cream - ingredient ?blender - appliance)
    :precondition (and
      (separate ?cream_cheese ?marshmallow_cream)
      (turned_off ?blender)
      (clean_appliance ?blender)
      (in_container ?cream_cheese ?blender)
      (in_container ?marshmallow_cream ?blender)
    )
    :effect (and
      (not (separate ?cream_cheese ?marshmallow_cream))
      (combined ?cream_cheese ?marshmallow_cream)
      (turned_on ?blender)
      (dirty_appliance ?blender)
      (not (clean_appliance ?blender))
      (full ?blender)
    )
  )

  ; Action 2: Pour the mixture into a clean bowl
  (:action pour_combined_into_bowl
    :parameters (?cream_cheese - ingredient ?marshmallow_cream - ingredient ?blender - appliance ?bowl - container)
    :precondition (and
      (combined ?cream_cheese ?marshmallow_cream)
      (turned_on ?blender)
      (full ?blender)
      (clean ?bowl)
      (empty ?bowl)
    )
    :effect (and
      (in_container ?cream_cheese ?bowl)
      (in_container ?marshmallow_cream ?bowl)
      (empty ?blender)
      (not (full ?blender))
      (full ?bowl)
      (dirty ?bowl)
      (not (empty ?bowl))
      (not (clean ?bowl))
      (turned_off ?blender)
    )
  )

  ; Action 3: Serve with fruit
  (:action serve_with_fruit
    :parameters (?fruit - ingredient ?bowl - container ?cream_cheese - ingredient ?marshmallow_cream - ingredient)
    :precondition (and
      (whole ?fruit)
      (full ?bowl)
      (in_container ?cream_cheese ?bowl)
      (in_container ?marshmallow_cream ?bowl)
    )
    :effect (and
      (sliced ?fruit)
    )
  )
)
