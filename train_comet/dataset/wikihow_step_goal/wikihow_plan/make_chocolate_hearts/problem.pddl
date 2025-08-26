(define (problem make_chocolate_hearts_problem)
  (:domain make_chocolate_hearts)
  (:objects
    chocolate ingredients mold microwave spoon - entity
  )
  (:init
    (at-cost chocolate in-store)
    (at-texture chocolate solid)
    (at-temperature chocolate colder)
    (at-location chocolate packaged)
    (at-hardness chocolate liquid)
    (at-ease-of-release chocolate hard-to-release-from-molds)
    (at-location ingredients in-cabinet)
    (at-fullness mold empty)
    (at-weight mold light)
    (at-power microwave off)
    (at-cleanness spoon clean)
  )
  (:goal
    (and
      (at-texture chocolate in-box)
    )
  )
)