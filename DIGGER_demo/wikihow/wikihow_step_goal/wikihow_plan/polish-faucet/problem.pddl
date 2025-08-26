(define (problem polish-faucet-problem)
  (:domain polish-faucet)
  (:objects
    lemon - entity
    faucet - entity
    juice - entity
    water - entity
  )
  (:init
    ;;     ：     ，
    (not (halved lemon))
    (not (juicy lemon))
    (not (lemon-squeezed lemon))

    ;;        ：   ，   ，
    (not (faucet-clean faucet))
    (not (faucet-shiny faucet))
    (not (faucet-wet faucet))

    ;;     ：     ，
    (not (juice-squeezed juice))
    (not (juice-on-faucet juice))

    ;;      ：
    (not (water-in-sink water))
  )
  (:goal
    (and
      (faucet-clean faucet)
      (faucet-shiny faucet)
    )
  )
)
