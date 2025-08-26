(define (problem make-smoothie)
  (:domain smoothie-making)
  (:objects
    yogurt bananas sorbet - ingredient
    rum - rum
    blender-1 - blender
    glass-1 - glass
    strawberry-1 - strawberry
  )

  (:init
    (clean blender-1)
    (chilled glass-1)
  )

  (:goal
    (garnished glass-1)
  )
)
