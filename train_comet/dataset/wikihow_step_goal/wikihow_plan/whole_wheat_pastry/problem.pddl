(define (problem make_whole_wheat_pastry)
  (:domain whole_wheat_pastry)
  (:objects
    whole_wheat_flour salt canola_oil - ingredient
    mixing_bowl pie_dish - container
    fork wax_paper - object
    table - location
  )

  (:init
    ;; 所有物品都在桌子上
    (at whole_wheat_flour table)
    (at salt table)
    (at canola_oil table)
    (at mixing_bowl table)
    (at pie_dish table)
    (at fork table)
    (at wax_paper table)
  )

  (:goal
    (and
      (edge_created)
    )
  )
)
