(define (domain BeadRingMaking)
  (:requirements :strips :typing)
  
  (:types
    bead
    elastic
    tail
    person
  )

  (:predicates
    (cut ?e - elastic)
    (on_strip ?b - bead)
    (in_order ?b - bead)
    (curved ?e - elastic)
    (adorned ?t - tail)
    (admiring ?p - person)
  )

  (:action CutElastic
    :parameters (?e - elastic)
    :precondition (not (cut ?e))
    :effect (cut ?e)
  )

  (:action SlipLargerBeads
    :parameters (?b - bead)
    :precondition (and (not (on_strip ?b)) (not (in_order ?b)))
    :effect (and (on_strip ?b) (in_order ?b))
  )

  (:action SlipSmallBead
    :parameters (?b - bead)
    :precondition (not (on_strip ?b))
    :effect (on_strip ?b)
  )

  (:action PatternBeads
    :parameters (?b - bead)
    :precondition (not (in_order ?b))
    :effect (in_order ?b)
  )

  (:action FinishRing
    :parameters (?e - elastic ?t - tail)
    :precondition (and (not (curved ?e)) (not (adorned ?t)))
    :effect (and (curved ?e) (adorned ?t))
  )

  (:action AdmireRing
    :parameters (?p - person)
    :precondition (not (admiring ?p))
    :effect (admiring ?p)
  )
)