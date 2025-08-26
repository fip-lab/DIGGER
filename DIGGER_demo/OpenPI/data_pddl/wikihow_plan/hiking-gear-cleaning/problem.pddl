(define (problem clean-synthetic-hiking-gear)
  (:domain hiking-gear-cleaning)
  (:objects
    instructions - instructions
    clothing - clothing
    polar_fleece - polar_fleece
    washing_machine - washing_machine
  )
  (:init
    (not (knowledge instructions))
    (cleanness clothing)
    (not (cleanness polar_fleece))
  )
  (:goal
    (and
      (knowledge instructions)
      (not (cleanness clothing))
      (cleanness polar_fleece)
    )
  )
)