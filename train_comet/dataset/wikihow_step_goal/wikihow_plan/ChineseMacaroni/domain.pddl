(define (domain chinese_macaroni)
  (:requirements :strips :typing)

  (:types
    ingredient container location - object
  )

  (:predicates
    ;; 位置谓词
    (at ?obj - object ?loc - location)
    ;; 食材状态谓词
    (cooked ?ing - ingredient)
    (cooled ?ing - ingredient)
    (seasoned ?ing - ingredient)
    (served ?ing - ingredient)
    ;; 食材在容器中
    (in ?ing - ingredient ?cont - container)
  )

  ;; 动作1：煮通心粉
  (:action boil_macaroni
    :parameters (?macaroni - ingredient ?pot - container ?kitchen - location)
    :precondition (and
      (at ?macaroni ?kitchen)
      (at ?pot ?kitchen)
      (not (cooked ?macaroni))
    )
    :effect (and
      (cooked ?macaroni)
      (in ?macaroni ?pot)
    )
  )

  ;; 动作2：冷却通心粉
  (:action cool_macaroni
    :parameters (?macaroni - ingredient ?pot - container ?sink - location)
    :precondition (and
      (cooked ?macaroni)
      (in ?macaroni ?pot)
      (at ?pot ?sink)
    )
    :effect (and
      (cooled ?macaroni)
    )
  )

  ;; 动作3：在平底锅中翻炒通心粉
  (:action toss_macaroni_in_pan
    :parameters (?macaroni - ingredient ?pan - container ?kitchen - location)
    :precondition (and
      (cooled ?macaroni)
      (at ?pan ?kitchen)
      (at ?macaroni ?kitchen)
    )
    :effect (and
      (in ?macaroni ?pan)
    )
  )

  ;; 动作4：加入调味料
  (:action add_seasoning
    :parameters (?macaroni - ingredient ?pan - container)
    :precondition (and
      (in ?macaroni ?pan)
      (not (seasoned ?macaroni))
    )
    :effect (and
      (seasoned ?macaroni)
    )
  )

  ;; 动作5：烹饪通心粉
  (:action cook_macaroni_in_pan
    :parameters (?macaroni - ingredient ?pan - container)
    :precondition (and
      (in ?macaroni ?pan)
      (seasoned ?macaroni)
    )
    :effect (and
      (cooked ?macaroni)
    )
  )

  ;; 动作6：盛盘并上桌
  (:action serve_macaroni
    :parameters (?macaroni - ingredient ?plate - container ?dining_table - location ?pan - container)
    :precondition (and
      (cooked ?macaroni)
      (in ?macaroni ?pan)
      (at ?plate ?dining_table)
    )
    :effect (and
      (in ?macaroni ?plate)
      (served ?macaroni)
    )
  )
)
