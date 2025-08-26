(define (domain pokemon-evolution)
  (:requirements :strips :typing)
  (:types pokemon)
  (:predicates
    (unused ?p - pokemon)
    (used ?p - pokemon)
    (untrained ?p - pokemon)
    (trained ?p - pokemon)
    (unevolved ?p - pokemon)
    (evolved ?p - pokemon)
    (unattained ?p - pokemon)
    (now-attained ?p - pokemon)
    (uncopied ?p - pokemon)
    (copied ?p - pokemon)
    (without-rare-candies ?p - pokemon)
    (now-holder-of-rare-candy ?p - pokemon)
  )

  (:action use-wailmer
    :parameters (?p - pokemon)
    :precondition (unused ?p)
    :effect (and (used ?p) (not (unused ?p)))
  )

  (:action train-wailmer
    :parameters (?p - pokemon)
    :precondition (untrained ?p)
    :effect (and (trained ?p) (not (untrained ?p)))
  )

  (:action evolve-wailmer
    :parameters (?p - pokemon)
    :precondition (unevolved ?p)
    :effect (and (evolved ?p) (not (unevolved ?p)))
  )

  (:action attain-battle-frontier
    :parameters (?p - pokemon)
    :precondition (unattained ?p)
    :effect (and (now-attained ?p) (not (unattained ?p)))
  )

  (:action copy-rare-candies
    :parameters (?p - pokemon)
    :precondition (uncopied ?p)
    :effect (and (copied ?p) (not (uncopied ?p)))
  )

  (:action give-rare-candies
    :parameters (?p - pokemon)
    :precondition (without-rare-candies ?p)
    :effect (and (now-holder-of-rare-candy ?p) (not (without-rare-candies ?p)))
  )
)