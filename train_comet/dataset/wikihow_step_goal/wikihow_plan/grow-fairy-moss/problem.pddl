(define (problem grow-fairy-moss-problem)
  (:domain grow-fairy-moss)
  
  (:objects
    fairy-moss - plant
    bowl-container - container
    water-1 - water
  )

  (:init
    ;; 初始状态
    (for-sale fairy-moss)
    (position-plant fairy-moss outside-of-bowl)
    (size fairy-moss larger)
    (shape fairy-moss mess)

    (loc bowl-container in-cabinet)
    (volume bowl-container empty)

    (comp water-1 just-water)
    (wetness water-1 dry)
    (position-water water-1 outside-bowl)
  )

  (:goal
    (and
      (purchased fairy-moss)
      (position-plant fairy-moss inside-bowl)
      (size fairy-moss smaller)
      (shape fairy-moss pruned)

      (loc bowl-container on-table)

      (comp water-1 now-mixed)
      (position-water water-1 in-suitable-position)
    )
  )
)
