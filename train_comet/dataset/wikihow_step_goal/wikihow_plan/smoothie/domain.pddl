(define (domain smoothie-making)
  (:requirements :strips :typing)
  (:types
    ingredient blender glass strawberry rum)

  (:predicates
    (clean ?bl - blender)
    (chilled ?g - glass)
    (in-blender ?i - ingredient ?bl - blender)
    (blended ?bl - blender)
    (contains-rum ?bl - blender)
    (smoothie-prepared ?bl - blender)
    (smoothie-in-glass ?g - glass)
    (garnished ?g - glass)
  )

  ;; Step 1: Place the yogurt, bananas, and sorbet in a blender.
  (:action place-ingredients
    :parameters (?y - ingredient ?b - ingredient ?s - ingredient ?bl - blender)
    :precondition (clean ?bl)
    :effect (and
      (in-blender ?y ?bl)
      (in-blender ?b ?bl)
      (in-blender ?s ?bl)
      (not (clean ?bl))
    )
  )

  ;; Step 2: Blend the mixture until it's smooth in texture.
  (:action blend-mixture
    :parameters (?bl - blender)
    :precondition (and
      (in-blender yogurt ?bl)
      (in-blender bananas ?bl)
      (in-blender sorbet ?bl)
      (not (blended ?bl))
    )
    :effect (blended ?bl)
  )

  ;; Step 3: Pour the rum in and quickly blend again.
  (:action add-rum-and-blend
    :parameters (?r - rum ?bl - blender)
    :precondition (and
      (blended ?bl)
      (not (contains-rum ?bl))
    )
    :effect (and
      (contains-rum ?bl)
      (smoothie-prepared ?bl)
    )
  )

  ;; Step 4: Pour the smoothie into chilled glasses.
  (:action pour-into-glass
    :parameters (?bl - blender ?g - glass)
    :precondition (and
      (smoothie-prepared ?bl)
      (chilled ?g)
    )
    :effect (smoothie-in-glass ?g)
  )

  ;; Step 5: Garnish each glass with a strawberry.
  (:action garnish-glass
    :parameters (?g - glass ?s - strawberry)
    :precondition (smoothie-in-glass ?g)
    :effect (garnished ?g)
  )
)
