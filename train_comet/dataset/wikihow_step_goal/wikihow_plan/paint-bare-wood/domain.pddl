(define (domain paint-bare-wood)
  (:requirements :strips :typing)

  (:types
    person tool material object
  )

  (:predicates
    ;; 工具与材料相关谓词
    (has_tool ?p - person ?t - tool)
    (has_paint ?p - person ?m - material)

    ;; 工具状态谓词
    (clean ?t - tool)
    (dirty ?t - tool)

    ;; 物体状态谓词
    (present ?o - object)
    (painted_under_coat ?o - object)
    (painted_second_coat ?o - object)
    (finished_painting ?o - object)

    ;; 涂料应用状态
    (paint_applied ?o - object ?m - material)
  )

  ;; 动作1：获取油性涂料
  (:action acquire_paint
    :parameters (?p - person ?m - material)
    :precondition (and
      (not (has_paint ?p ?m))
    )
    :effect (has_paint ?p ?m)
  )

  ;; 动作2：获取画笔
  (:action acquire_tool
    :parameters (?p - person ?t - tool)
    :precondition (and
      (not (has_tool ?p ?t))
    )
    :effect (has_tool ?p ?t)
  )

  ;; 动作3：清洁工具
  (:action clean_tool
    :parameters (?t - tool)
    :precondition (and
      (dirty ?t)
    )
    :effect (clean ?t)
  )

  ;; 动作4：涂抹底漆
  (:action apply_under_coat
    :parameters (?p - person ?t - tool ?m - material ?o - object)
    :precondition (and
      (has_paint ?p ?m)
      (has_tool ?p ?t)
      (clean ?t)
      (present ?o)
      (not (painted_under_coat ?o))
    )
    :effect (and
      (paint_applied ?o ?m)
      (painted_under_coat ?o)
      (dirty ?t)
    )
  )

  ;; 动作5：涂抹第二层涂料
  (:action apply_second_coat
    :parameters (?p - person ?t - tool ?m - material ?o - object)
    :precondition (and
      (has_paint ?p ?m)
      (has_tool ?p ?t)
      (dirty ?t)
      (present ?o)
      (painted_under_coat ?o)
      (not (painted_second_coat ?o))
    )
    :effect (and
      (paint_applied ?o ?m)
      (painted_second_coat ?o)
      (dirty ?t)
    )
  )

  ;; 动作6：完成涂漆
  (:action finish_painting
    :parameters (?p - person ?o - object)
    :precondition (and
      (painted_second_coat ?o)
    )
    :effect (finished_painting ?o)
  )
)
