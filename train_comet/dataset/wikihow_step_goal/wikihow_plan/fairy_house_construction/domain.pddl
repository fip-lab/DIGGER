(define (domain fairy_house_construction)
  (:requirements :strips :typing)

  (:types
    area
    stick
    fairy_house
  )

  (:predicates
    ;; 区域相关
    (selected_area ?a - area)

    ;; 棍子相关
    (collected ?s - stick)
    (bundled ?s - stick)
    (in_formation ?s - stick)
    (tied_with_bark ?s - stick)

    ;; 房屋相关
    (built_walls ?f - fairy_house)
    (decorated ?f - fairy_house)
  )

  ;; 动作1：选择区域
  (:action find_area
    :parameters (?a - area)
    :precondition (not (selected_area ?a))
    :effect (selected_area ?a)
  )

  ;; 动作2：收集棍子
  (:action collect_sticks
    :parameters (?s - stick)
    :precondition (not (collected ?s))
    :effect (collected ?s)
  )

  ;; 动作3：捆绑棍子
  (:action bundle_sticks
    :parameters (?s - stick)
    :precondition (collected ?s)
    :effect (bundled ?s)
  )

  ;; 动作4：创建结构
  (:action create_formation
    :parameters (?s - stick)
    :precondition (bundled ?s)
    :effect (in_formation ?s)
  )

  ;; 动作5：建造墙壁
  (:action build_walls
    :parameters (?f - fairy_house ?s - stick)
    :precondition (and
                    (in_formation ?s)
                    (not (built_walls ?f))
                  )
    :effect (built_walls ?f)
  )

  ;; 动作6：使用树皮装饰
  (:action use_bark
    :parameters (?s - stick)
    :precondition (bundled ?s)
    :effect (tied_with_bark ?s)
  )

  ;; 动作7：装饰仙女屋
  (:action decorate_fairy_house
    :parameters (?f - fairy_house)
    :precondition (built_walls ?f)
    :effect (decorated ?f)
  )
)
