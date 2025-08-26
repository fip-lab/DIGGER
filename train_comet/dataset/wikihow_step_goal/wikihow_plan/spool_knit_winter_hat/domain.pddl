(define (domain spool_knit_winter_hat)
  (:requirements :strips :typing)

  (:types
    webbing
    hat
    yarn
    ends
  )

  (:predicates
    ;; Webbing状态
    (in_line ?w - webbing)
    (knitted_together ?w - webbing)
    (shape_straight ?w - webbing)
    (shape_rectangular ?w - webbing)
    (width_wider ?w - webbing)
    (width_narrower ?w - webbing)

    ;; Hat状态
    (has_weight_lighter ?h - hat)
    (has_weight_heavier ?h - hat)

    ;; Yarn状态
    (shape_straight_yarn ?y - yarn)
    (shape_twisted_and_folded ?y - yarn)

    ;; Ends状态
    (unjoined ?e - ends)
    (joined ?e - ends)
  )

  ;; 动作1：编织网
  (:action knit_web
    :parameters (?w - webbing)
    :precondition (in_line ?w)
    :effect (and
              (knitted_together ?w)
              (not (in_line ?w))
            )
  )

  ;; 动作2：将网缝制成矩形
  (:action sew_web_into_rectangle
    :parameters (?w - webbing)
    :precondition (and
                    (shape_straight ?w)
                    (width_wider ?w)
                  )
    :effect (and
              (shape_rectangular ?w)
              (width_narrower ?w)
              (not (shape_straight ?w))
              (not (width_wider ?w))
            )
  )

  ;; 动作3：连接末端
  (:action join_ends
    :parameters (?e - ends)
    :precondition (unjoined ?e)
    :effect (and
              (joined ?e)
              (not (unjoined ?e))
            )
  )

  ;; 动作4：固定顶部并制作流苏
  (:action secure_top_and_make_tassel
    :parameters (?h - hat ?y - yarn)
    :precondition (and
                    (has_weight_lighter ?h)
                    (shape_straight_yarn ?y)
                  )
    :effect (and
              (has_weight_heavier ?h)
              (shape_twisted_and_folded ?y)
              (not (has_weight_lighter ?h))
              (not (shape_straight_yarn ?y))
            )
  )
)
