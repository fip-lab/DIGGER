(define (problem make_marshmallow_dip_problem)
  (:domain marshmallow_dip)
  (:objects
    cream_cheese marshmallow_cream - ingredient
    blender - appliance
    mixing_bowl - container
    fruit - ingredient
  )
  (:init
    ; Ingredient initial states
    (separate cream_cheese marshmallow_cream)
    (whole fruit)

    ; Appliance initial states
    (turned_off blender)
    (clean_appliance blender)
    (empty blender)

    ; Container initial states
    (clean mixing_bowl)
    (empty mixing_bowl)

    ; Ingredients in appliances/containers
    (in_container cream_cheese blender)
    (in_container marshmallow_cream blender)
  )
  (:goal
    (and
      (combined cream_cheese marshmallow_cream)
      (in_container cream_cheese mixing_bowl)
      (in_container marshmallow_cream mixing_bowl)
      (full mixing_bowl)
      (sliced fruit)
    )
  )
)
