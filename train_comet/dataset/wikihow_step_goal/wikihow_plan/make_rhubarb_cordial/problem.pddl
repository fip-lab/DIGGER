(define (problem make_rhubarb_cordial)
  (:domain make_rhubarb_cordial)
  (:objects
    rhubarb sugar cloves water - ingredient
    pot stove - tool
    mint_leaves - decoration
    cordial - product
  )

  (:init
    (pot_on_stove pot stove)
  )

  (:goal
    (and
      (garnished_with cordial mint_leaves)
    )
  )
)
