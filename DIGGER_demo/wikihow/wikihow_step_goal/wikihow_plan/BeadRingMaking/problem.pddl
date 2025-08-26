(define (problem MakeBeadRing)
  (:domain BeadRingMaking)
  
  (:objects
    bead1 bead2 bead3 - bead
    elastic1 - elastic
    tail1 - tail
    you - person
  )
  
  (:init
    (not (cut elastic1))
    (not (on_strip bead1)) (not (on_strip bead2)) (not (on_strip bead3))
    (not (in_order bead1)) (not (in_order bead2)) (not (in_order bead3))
    (not (curved elastic1))
    (not (adorned tail1))
    (not (admiring you))
  )

  (:goal
    (and
      (cut elastic1)
      (on_strip bead1) (in_order bead1)
      (on_strip bead2) (in_order bead2)
      (on_strip bead3) (in_order bead3)
      (curved elastic1)
      (adorned tail1)
      (admiring you)
    )
  )
)