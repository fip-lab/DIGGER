(define (problem towel-folding)
  (:domain towels)
  (:objects 
    towel1 - towel
    linen_closet towel_rack outside - location)

  (:init 
    (at towel1 outside)
    (not (folded towel1))
    (not (smaller towel1))
    (not (thicker towel1))
    (not (in-closet towel1))
    (not (on-rack towel1))
    (not (emptiness towel1))
    (not (openness towel1)))

  (:goal 
    (and
      (on-rack towel1)
      (openness towel1))))