(define (domain towels)
  (:requirements :strips :typing)
  (:types towel location)

  (:predicates 
    (at ?towel - towel ?loc - location)
    (folded ?towel - towel)
    (in-closet ?towel - towel)
    (on-rack ?towel - towel)
    (smaller ?towel - towel)
    (thicker ?towel - towel)
    (emptiness ?towel - towel)
    (openness ?towel - towel))

  (:action fold-lengthwise
    :parameters (?towel - towel)
    :precondition (and (not (folded ?towel)) (not (smaller ?towel)))
    :effect (and (folded ?towel) (smaller ?towel)))

  (:action fold-half-twice
    :parameters (?towel - towel)
    :precondition (and (folded ?towel) (smaller ?towel) (not (thicker ?towel)))
    :effect (and (thicker ?towel)))

  (:action store-in-closet
    :parameters (?towel - towel)
    :precondition (and (thicker ?towel) (not (in-closet ?towel)) (not (emptiness ?towel)))
    :effect (and (in-closet ?towel) (emptiness ?towel)))

  (:action hang-on-rack
    :parameters (?towel - towel)
    :precondition (and (in-closet ?towel) (folded ?towel) (not (on-rack ?towel)) (emptiness ?towel))
    :effect (and (on-rack ?towel) (not (folded ?towel)) (openness ?towel))))