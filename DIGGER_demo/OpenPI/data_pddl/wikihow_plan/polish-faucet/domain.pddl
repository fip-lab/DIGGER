(define (domain polish-faucet)
  (:requirements :strips :typing)
  (:types entity)

  (:predicates
    ;; Lemon predicates
    (halved ?lemon - entity)
    (juicy ?lemon - entity)
    (lemon-squeezed ?lemon - entity)

    ;; Juice predicates
    (juice-squeezed ?juice - entity)
    (juice-on-faucet ?juice - entity)

    ;; Faucet predicates
    (faucet-clean ?faucet - entity)
    (faucet-shiny ?faucet - entity)
    (faucet-wet ?faucet - entity)

    ;; Water predicates
    (water-in-sink ?water - entity)

    ;; Utility predicates (optional, based on detailed attributes)
    ;;
  )

  ;; Action to cut the lemon in half
  (:action cut-lemon
    :parameters (?lemon - entity)
    :precondition (not (halved ?lemon))
    :effect (halved ?lemon)
  )

  ;; Action to squeeze the lemon to extract juice
  (:action squeeze-lemon
    :parameters (?lemon - entity ?juice - entity)
    :precondition (and (halved ?lemon) (not (lemon-squeezed ?lemon)))
    :effect (and
              (lemon-squeezed ?lemon)
              (juice-squeezed ?juice)
              (juicy ?lemon)
            )
  )

  ;; Action to rub the faucet with the squeezed lemon half
  (:action rub-faucet
    :parameters (?faucet - entity ?lemon - entity ?juice - entity)
    :precondition (and
                    (juice-squeezed ?juice)
                    (halved ?lemon)
                  )
    :effect (and
              (faucet-wet ?faucet)
              (faucet-clean ?faucet)
              (faucet-shiny ?faucet)
              (juice-on-faucet ?juice)
            )
  )

  ;; Action to wash the faucet after scouring
  (:action wash-faucet
    :parameters (?faucet - entity ?water - entity ?juice - entity)
    :precondition (juice-on-faucet ?juice)
    :effect (and
              (water-in-sink ?water)
              (faucet-clean ?faucet)
              (not (juice-on-faucet ?juice))
              (not (faucet-wet ?faucet)) ;;
            )
  )
)
