(define (domain whole_wheat_pastry)
  (:requirements :strips :typing)
  (:types
    ingredient tool container object location
  )

  (:predicates
    ;; 位置关系
    (at ?obj - object ?loc - location)
    ;; 食材在容器中
    (in ?ing - ingredient ?c - container)
    ;; 搅拌完成
    (mixed ?c - container)
    ;; 酥皮已准备好
    (pastry_ready)
    ;; 酥皮在派盘中
    (pastry_in_dish)
    ;; 边缘已创建
    (edge_created)
  )

  ;; 动作1：将全麦面粉和盐加入搅拌碗
  (:action add_flour_and_salt
    :parameters (?flour - ingredient ?salt - ingredient ?bowl - container ?table - location)
    :precondition (and
      (at ?flour ?table)
      (at ?salt ?table)
      (at ?bowl ?table)
    )
    :effect (and
      (in ?flour ?bowl)
      (in ?salt ?bowl)
    )
  )

  ;; 动作2：将油倒入搅拌碗
  (:action pour_in_oil
    :parameters (?oil - ingredient ?bowl - container ?flour - ingredient ?salt - ingredient ?table - location)
    :precondition (and
      (in ?flour ?bowl)
      (in ?salt ?bowl)
      (at ?oil ?table)
    )
    :effect (and
      (in ?oil ?bowl)
    )
  )

  ;; 动作3：混合食材
  (:action mix_ingredients
    :parameters (?oil - ingredient ?bowl - container ?flour - ingredient ?salt - ingredient)
    :precondition (and
      (in ?flour ?bowl)
      (in ?salt ?bowl)
      (in ?oil ?bowl)
    )
    :effect (and
      (mixed ?bowl)
    )
  )

  ;; 动作4：准备酥皮
  (:action prepare_pastry
    :parameters (?bowl - container ?wax_paper - object ?table - location)
    :precondition (and
      (mixed ?bowl)
      (at ?wax_paper ?table)
    )
    :effect (and
      (pastry_ready)
    )
  )

  ;; 动作5：将酥皮按压到派盘中
  (:action press_into_pie_dish
    :parameters (?pie_dish - container ?table - location)
    :precondition (and
      (pastry_ready)
      (at ?pie_dish ?table)
    )
    :effect (and
      (pastry_in_dish)
    )
  )

  ;; 动作6：用叉子创建边缘
  (:action create_edge
    :parameters (?fork - object ?table - location)
    :precondition (and
      (pastry_in_dish)
      (at ?fork ?table)
    )
    :effect (and
      (edge_created)
    )
  )
)
