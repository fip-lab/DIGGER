(define (domain recycle_underpants)
  (:requirements :strips :typing)

  (:types
    item
    underpants - item
    tool - item
    plant
    location - object
  )

  (:predicates
    ;; 位置谓词
    (at ?obj - item ?loc - location)
    ;; 内裤的属性
    (is_old ?u - underpants)
    ;; 内裤的用途
    (used_as_cleaning_rags ?u - underpants)
    (used_as_garden_ties ?u - underpants)
    (used_as_craft_item ?u - underpants)
    (used_as_stuffing ?u - underpants)
    (worn_by_child ?u - underpants)
    (donated ?u - underpants)
    ;; 植物的属性
    (tied ?pl - plant)
    ;; 工具状态
    (available ?t - tool)
  )

  ;; 动作1: 将内裤变成清洁抹布
  (:action make_cleaning_rags
    :parameters (?u - underpants)
    :precondition (and
      (at ?u drawer)
      (not (is_old ?u))
    )
    :effect (and
      (is_old ?u)
      (used_as_cleaning_rags ?u)
    )
  )

  ;; 动作2: 使用内裤作为园艺绑带
  (:action make_garden_ties
    :parameters (?u - underpants ?t - tool ?pl - plant)
    :precondition (and
      (at ?u drawer)
      (available ?t)
      (not (is_old ?u))
    )
    :effect (and
      (is_old ?u)
      (used_as_garden_ties ?u)
      (tied ?pl)
    )
  )

  ;; 动作3: 将内裤制作成工艺品
  (:action make_craft_item
    :parameters (?u - underpants ?t - tool)
    :precondition (and
      (at ?u drawer)
      (available ?t)
      (not (is_old ?u))
    )
    :effect (and
      (is_old ?u)
      (used_as_craft_item ?u)
    )
  )

  ;; 动作4: 将内裤用作填充物
  (:action use_as_stuffing
    :parameters (?u - underpants)
    :precondition (and
      (at ?u drawer)
      (is_old ?u)
    )
    :effect (used_as_stuffing ?u)
  )

  ;; 动作5: 孩子穿着旧内裤玩超级英雄
  (:action child_wears_underpants
    :parameters (?u - underpants)
    :precondition (and
      (at ?u drawer)
      (is_old ?u)
    )
    :effect (worn_by_child ?u)
  )

  ;; 动作6: 捐赠内裤
  (:action donate_underpants
    :parameters (?u - underpants)
    :precondition (and
      (at ?u drawer)
      (is_old ?u)
    )
    :effect (donated ?u)
  )
)
