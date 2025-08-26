(define (domain grow-fairy-moss)
  (:requirements :strips :typing)
  (:types plant container water)

  (:predicates
    ;; Plant predicates
    (for-sale ?p - plant)
    (purchased ?p - plant)
    (position-plant ?p - plant ?pos)
    (size ?p - plant ?sz)
    (shape ?p - plant ?sh)

    ;; Container predicates
    (loc ?c - container ?location)
    (volume ?c - container ?vol)

    ;; Water predicates
    (comp ?w - water ?comp)
    (wetness ?w - water ?wts)
    (position-water ?w - water ?pos)
  )

  ;; Action: 询问购买蕨类苔藓
  (:action ask-for-moss
    :parameters (?p - plant)
    :precondition (for-sale ?p)
    :effect (purchased ?p)
  )

  ;; Action: 找到适合的容器
  (:action find-container
    :parameters (?c - container)
    :precondition (loc ?c in-cabinet)
    :effect (loc ?c on-countertop)
  )

  ;; Action: 填充水碗
  (:action fill-bowl
    :parameters (?w - water ?c - container)
    :precondition (and
                    (loc ?c on-countertop)
                    (wetness ?w dry)
                    (volume ?c empty))
    :effect (and
              (comp ?w filled)
              (wetness ?w wet)
              (position-water ?w inside-bowl)
              (volume ?c filled))
  )

  ;; Action: 添加蕨类苔藓
  (:action add-fairy-moss
    :parameters (?p - plant ?w - water)
    :precondition (and
                    (purchased ?p)
                    (position-plant ?p outside-of-bowl)
                    (comp ?w filled))
    :effect (and
              (position-plant ?p inside-bowl)
              (comp ?w now-mixed))
  )

  ;; Action: 放置到合适的位置
  (:action place-suitable-position
    :parameters (?c - container ?w - water)
    :precondition (and
                    (loc ?c on-countertop)
                    (position-water ?w inside-bowl))
    :effect (and
              (loc ?c on-table)
              (position-water ?w in-suitable-position))
  )

  ;; Action: 修剪蕨类苔藓
  (:action prune
    :parameters (?p - plant)
    :precondition (and
                    (size ?p larger)
                    (shape ?p mess))
    :effect (and
              (size ?p smaller)
              (shape ?p pruned))
  )
)
