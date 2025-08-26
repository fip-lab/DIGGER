(define (problem PaintRemovalTask)
  (:domain PaintRemoval)

  (:objects
    ; Items
    window01 - window
    razor_blade_package01 - razor_blade_package
    razor_blade01 - razor_blade
    sponge01 - sponge
    bucket01 - bucket
    soap_bottle01 - soap_bottle
    glass_cleaner_bottle01 - glass_cleaner_bottle
    cloth01 - cloth
    solvent01 - solvent
  )

  (:init
    ; Initial window state
    (dry window01)
    (dirty window01)
    (contains_paint window01)
    (contains_splatters window01)
    (opaque window01)
    (not (transparent window01))

    ; Tools and containers
    (closed razor_blade_package01)
    (clean_tool sponge01)
    (clean_tool razor_blade01)
    (empty bucket01)
    (full soap_bottle01)
    (has_glass_cleaner glass_cleaner_bottle01)
    (clean_cloth cloth01)
    (has_solvent solvent01)

    ; Items not in hand
    (not (in_hand razor_blade_package01))
    (not (in_hand razor_blade01))
    (not (in_hand sponge01))
    (not (in_hand bucket01))
    (not (in_hand soap_bottle01))
    (not (in_hand glass_cleaner_bottle01))
    (not (in_hand cloth01))
    (not (in_hand solvent01))
  )

  (:goal
    (and
      (clean window01)
      (transparent window01)
      (dirty_cloth cloth01)
      (dirty_tool sponge01)
      (dirty_tool razor_blade01)
      (not (contains_paint window01))
      (not (contains_splatters window01))
      (not (has_glass_cleaner glass_cleaner_bottle01))
      (not (has_solvent solvent01))
    )
  )
)
