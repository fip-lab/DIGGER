(define (problem get-wailord)
  (:domain pokemon-evolution)
  (:objects
    wailmer - pokemon
  )
  (:init
    (unused wailmer)
    (untrained wailmer)
    (unevolved wailmer)
    (unattained wailmer)
    (uncopied wailmer)
    (without-rare-candies wailmer)
  )
  (:goal
    (and
      (used wailmer)
      (trained wailmer)
      (evolved wailmer)
      (now-attained wailmer)
      (copied wailmer)
      (now-holder-of-rare-candy wailmer)
    )
  )
)