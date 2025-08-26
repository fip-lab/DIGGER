(define (domain make_rhubarb_cordial)
  (:requirements :strips :typing)
  (:types
    ingredient tool decoration product
  )

  (:predicates
    (in_pot ?i - ingredient ?pot - tool)          ; Ingredient in pot
    (pot_on_stove ?pot - tool ?stove - tool)     ; Pot is on stove
    (simmering ?pot - tool)                       ; Pot is simmering
    (soft ?i - ingredient)                        ; Ingredient is soft
    (cooked ?pot - tool)                           ; Pot contents are cooked
    (product_ready ?p - product)                   ; Product is ready
    (off_heat ?pot - tool)                         ; Pot is off heat
    (garnished_with ?p - product ?d - decoration)  ; Product is garnished with decoration
  )

  ;; Action to place ingredients in pot
  (:action place_ingredients
    :parameters (?r - ingredient ?s - ingredient ?c - ingredient ?w - ingredient ?pot - tool ?stove - tool)
    :precondition (pot_on_stove ?pot ?stove)
    :effect (and
      (in_pot ?r ?pot)
      (in_pot ?s ?pot)
      (in_pot ?c ?pot)
      (in_pot ?w ?pot)
    )
  )

  ;; Action to simmer the pot
  (:action simmer_pot
    :parameters (?pot - tool ?stove - tool ?p - product)
    :precondition (and
      (in_pot rhubarb ?pot)
      (in_pot sugar ?pot)
      (in_pot cloves ?pot)
      (in_pot water ?pot)
      (pot_on_stove ?pot ?stove)
    )
    :effect (and
      (simmering ?pot)
      (cooked ?pot)
      (soft rhubarb)
      (product_ready ?p)
    )
  )

  ;; Action to remove pot from heat
  (:action remove_from_heat
    :parameters (?pot - tool ?stove - tool)
    :precondition (and
      (simmering ?pot)
      (pot_on_stove ?pot ?stove)
    )
    :effect (and
      (off_heat ?pot)
      (not (pot_on_stove ?pot ?stove))
    )
  )

  ;; Action to garnish with mint leaves
  (:action garnish_with_mint
    :parameters (?p - product ?d - decoration ?pot - tool)
    :precondition (and
      (product_ready ?p)
      (off_heat ?pot)
    )
    :effect (garnished_with ?p ?d)
  )
)
