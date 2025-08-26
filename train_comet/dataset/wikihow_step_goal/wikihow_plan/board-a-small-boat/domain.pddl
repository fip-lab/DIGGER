(define (domain board-a-small-boat)
  (:requirements :strips :typing)

  (:types
    passenger platform dock boat - object
  )

  (:predicates
    ;; 位置相关谓词：对象位于某地
    (at ?obj - object ?place - object)

    ;; 持握扶手
    (holding-rail ?p - passenger)

    ;; 双腿在船内
    (legs-in-boat ?p - passenger)

    ;; 船只已居中
    (centered ?b - boat)

    ;; 乘客已蹲下
    (crouched ?p - passenger)

    ;; 船只稳定
    (boat-stable ?b - boat)

    ;; 平台存在
    (platform-present ?pl - platform)

    ;; 船在码头
    (boat-at-dock ?b - boat)

    ;; 船正在移动
    (boat-moving ?b - boat)
  )

  ;; 动作1：通过平台登船
  (:action board_via_platform
    :parameters (?p - passenger ?pl - platform ?b - boat ?d - dock)
    :precondition (and
                    (platform-present ?pl)
                    (at ?p ?pl)
                    (at ?pl ?d)
                    (at ?b ?d))
    :effect (and
              (at ?p ?b)
              (not (at ?p ?pl))
             )
  )

  ;; 动作2：握住扶手
  (:action hold_rails
    :parameters (?p - passenger ?b - boat)
    :precondition (at ?p ?b)
    :effect (holding-rail ?p)
  )

  ;; 动作3：确保双腿在船内
  (:action secure_legs
    :parameters (?p - passenger ?b - boat)
    :precondition (at ?p ?b)
    :effect (legs-in-boat ?p)
  )

  ;; 动作4：稳定船只
  (:action stabilize_boat
    :parameters (?p - passenger ?b - boat)
    :precondition (and
                    (legs-in-boat ?p)
                    (holding-rail ?p)
                    (at ?p ?b))
    :effect (and
              (centered ?b)
              (crouched ?p)
              (boat-stable ?b)
             )
  )

  ;; 动作5：他人保持船只稳定
  (:action others_keep_boat_steady
    :parameters (?op - passenger ?b - boat)
    :precondition (boat-stable ?b)
    :effect (at ?op ?b)
  )

)
