(define (problem polish-faucet-problem)
  (:domain polish-faucet)
  (:objects
    lemon - entity
    faucet - entity
    juice - entity
    water - entity
  )
  (:init
    ;; 初始状态：柠檬未切半，未挤压
    (not (halved lemon))
    (not (juicy lemon))
    (not (lemon-squeezed lemon))

    ;; 水龙头初始状态：未清洁，未擦亮，干燥
    (not (faucet-clean faucet))
    (not (faucet-shiny faucet))
    (not (faucet-wet faucet))

    ;; 初始状态：汁液未挤压，未在水龙头上
    (not (juice-squeezed juice))
    (not (juice-on-faucet juice))

    ;; 水初始状态：未在水槽中
    (not (water-in-sink water))
  )
  (:goal
    (and
      (faucet-clean faucet)
      (faucet-shiny faucet)
    )
  )
)
