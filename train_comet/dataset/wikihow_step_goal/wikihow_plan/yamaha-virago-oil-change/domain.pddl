(define (domain yamaha-virago-oil-change)
  (:requirements :strips :typing)

  (:types
    item
    tool container liquid vehicle

    oil bung oil_filter oil_cap funnel - tool
    bike oil_tank can jug bottle - container
    old_oil new_oil - liquid
  )

  (:predicates
    ;; 位置相关谓词
    (in ?item - item ?loc - container)
    (on ?item - tool ?loc - container)

    ;; 状态相关谓词
    (attached ?bung - bung)
    (full ?item - item)
    (empty ?item - item)
    (dirty ?funnel - funnel)
    (clean ?funnel - funnel)
    (open ?oil_cap - oil_cap)
    (closed ?oil_cap - oil_cap)
    (out ?oil_filter - oil_filter)
    (in_filter ?oil_filter - oil_filter)
    (loose ?bung - bung)
    (away-from-bike ?bung - bung)
    (have_some ?oil - oil ?bung - bung)
  )

  ;; 动作：移除油塞
  (:action remove-bung
    :parameters (?oil - oil ?bung - bung ?bike - vehicle ?can - container)
    :precondition (and
                    (in ?oil ?bike)
                    (attached ?bung)
                    (full ?bung))
    :effect (and
              (in ?oil ?can)
              (not (attached ?bung))
              (have_some ?oil ?bung)
              )
  )

  ;; 动作：移除油盖
  (:action remove-oil-cap
    :parameters (?oil_cap - oil_cap ?oil_tank - container ?bung - bung ?bike - vehicle ?oil - oil)
    :precondition (and
                    (on ?oil_cap ?oil_tank)
                    (closed ?oil_cap)
                    (have_some ?oil ?bung)
                    )
    :effect (and
              (not (on ?oil_cap ?oil_tank))
              (open ?oil_cap)
              (not (in ?oil ?bike))
              (empty ?bung)
              )
  )

  ;; 动作：移除油滤器
  (:action remove-oil-filter
    :parameters (?oil_filter - oil_filter ?oil_tank - container ?bike - vehicle ?oil - oil)
    :precondition (and (in_filter ?oil_filter) (not (in ?oil ?bike)))
    :effect (and
              (not (in_filter ?oil_filter))
              (out ?oil_filter)
              )
  )

  ;; 动作：重新安装油塞
  (:action screw-bung
    :parameters (?bung - bung ?bike - vehicle ?oil - oil ?oil_filter - oil_filter)
    :precondition (and
                    (away-from-bike ?bung)
                    (loose ?bung)
                    (out ?oil_filter)
                    (not (in ?oil ?bike)
                    )
                    )
    :effect (and
              (on ?bung ?bike)
              (attached ?bung))
  )

  ;; 动作：添加新油
  (:action fill-oil
    :parameters (?new_oil - new_oil ?bottle - container ?oil_tank - container ?bung - bung ?bike - vehicle)
    :precondition (and
                    (empty ?new_oil)
                    (in ?new_oil ?bottle)
                    (on ?bung ?bike)
                    )
    :effect (and
              (full ?new_oil)
              (in ?new_oil ?oil_tank))
  )

  ;; 动作：回收旧油
  (:action recycle-old-oil
    :parameters (?old_oil - old_oil ?funnel - funnel ?can - container ?jug - container)
    :precondition (and
                    (in ?old_oil ?can)
                    (clean ?funnel))
    :effect (and
              (in ?old_oil ?jug)
              (dirty ?funnel))
  )

)
