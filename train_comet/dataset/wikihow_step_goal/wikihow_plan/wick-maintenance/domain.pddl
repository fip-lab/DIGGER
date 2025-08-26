(define (domain wick-maintenance)
  (:requirements :strips :typing)
  (:types
    wick vinegar lamp container
  )

  (:predicates
    (in_lamp ?w - wick)                   ; 灯芯在灯中
    (removed ?w - wick)                   ; 灯芯已移除
    (wet ?w - wick)                       ; 灯芯湿润
    (dry ?w - wick)                       ; 灯芯干燥
    (in_vinegar ?w - wick)                ; 灯芯在醋中
    (vinegar_in_container ?v - vinegar)    ; 醋在容器中
    (in_container ?c - container ?v - vinegar) ; 醋在特定容器中
    (placed_back ?w - wick ?l - lamp)     ; 灯芯已放回灯中
    (get ?w - wick)
  )

  ;; 移除灯芯的动作
  (:action remove_wicks
    :parameters (?w - wick)
    :precondition (and (in_lamp ?w))
    :effect (and
     (removed ?w)
     (not (in_lamp ?w))
     (get ?w)
     )
  )

  ;; 将醋倒入容器的动作
  (:action put_vinegar_in_container
    :parameters (?v - vinegar ?c - container)
    :precondition (not (vinegar_in_container ?v))
    :effect (and (vinegar_in_container ?v) (in_container ?c ?v))
  )

  ;; 将灯芯浸泡在醋中的动作
  (:action dip_wicks_in_vinegar
    :parameters (?w - wick ?v - vinegar ?c - container)
    :precondition (and (get ?w) (vinegar_in_container ?v) (in_container ?c ?v))
    :effect (and (wet ?w) (in_vinegar ?w))
  )

  ;; 晾干灯芯的动作
  (:action dry_wicks
    :parameters (?w - wick)
    :precondition (wet ?w)
    :effect (and (dry ?w) (not (wet ?w)))
  )

  ;; 将灯芯放回灯中的动作
  (:action place_wicks_in_lamp
    :parameters (?w - wick ?l - lamp)
    :precondition (and (dry ?w) (not (in_lamp ?w)))
    :effect (and (in_lamp ?w) (placed_back ?w ?l))
  )
)
