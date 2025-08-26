(define (domain melon-pina-coladas)
  (:requirements :strips :typing)

  (:types
    ingredient mixture pitcher glass refrigerator honeydew - object
  )

  (:predicates
    ;; 位置相关谓词
    (in ?item - object ?container - object)

    ;; 状态相关谓词
    (mixed ?p - pitcher)
    (chilled ?p - pitcher)
    (in_glass ?m - mixture ?g - glass)
    (garnished ?h - honeydew ?g - glass)
    (on_table ?g - glass)
    (empty ?p - pitcher)
  )

  ;; 动作1：将配料倒入壶中
  (:action pour_ingredients_into_pitcher
    :parameters (?m - mixture ?p - pitcher ?l - object)
    :precondition (and
      (empty ?p)
      (in ?m ?l)
    )
    :effect (and
      (in ?m ?p)
      (not (empty ?p))
      (not (in ?m ?l))
    )
  )

  ;; 动作2：充分混合
  (:action mix_pitcher
    :parameters (?p - pitcher ?m - mixture)
    :precondition (and
      (in ?m ?p)
      (not (mixed ?p))
    )
    :effect (mixed ?p)
  )

  ;; 动作3：冷藏混合物
  (:action chill_mixture
    :parameters (?p - pitcher ?r - refrigerator)
    :precondition (mixed ?p)
    :effect (chilled ?p)
  )

  ;; 动作4：将混合物倒入杯中
  (:action pour_into_glass
    :parameters (?m - mixture ?p - pitcher ?g - glass)
    :precondition (and
      (chilled ?p)
      (in ?m ?p)
    )
    :effect (and
      (in_glass ?m ?g)
      (empty ?p)
      (not (in ?m ?p))
    )
  )

  ;; 动作5：添加蜜瓜装饰
  (:action add_garnish
    :parameters (?h - honeydew ?g - glass ?m - mixture)
    :precondition (in_glass ?m ?g)
    :effect (and
      (garnished ?h ?g)
      (on_table ?g)
    )
  )
)
