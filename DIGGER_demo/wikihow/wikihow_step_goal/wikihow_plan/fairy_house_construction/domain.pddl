(define (domain fairy_house_construction)
  (:requirements :strips :typing)

  (:types
    area
    stick
    fairy_house
  )

  (:predicates
    ;;
    (selected_area ?a - area)

    ;;
    (collected ?s - stick)
    (bundled ?s - stick)
    (in_formation ?s - stick)
    (tied_with_bark ?s - stick)

    ;;
    (built_walls ?f - fairy_house)
    (decorated ?f - fairy_house)
  )

  ;;   1：
  (:action find_area
    :parameters (?a - area)
    :precondition (not (selected_area ?a))
    :effect (selected_area ?a)
  )

  ;;   2：
  (:action collect_sticks
    :parameters (?s - stick)
    :precondition (not (collected ?s))
    :effect (collected ?s)
  )

  ;;   3：
  (:action bundle_sticks
    :parameters (?s - stick)
    :precondition (collected ?s)
    :effect (bundled ?s)
  )

  ;;   4：
  (:action create_formation
    :parameters (?s - stick)
    :precondition (bundled ?s)
    :effect (in_formation ?s)
  )

  ;;   5：
  (:action build_walls
    :parameters (?f - fairy_house ?s - stick)
    :precondition (and
                    (in_formation ?s)
                    (not (built_walls ?f))
                  )
    :effect (built_walls ?f)
  )

  ;;   6：
  (:action use_bark
    :parameters (?s - stick)
    :precondition (bundled ?s)
    :effect (tied_with_bark ?s)
  )

  ;;   7：
  (:action decorate_fairy_house
    :parameters (?f - fairy_house)
    :precondition (built_walls ?f)
    :effect (decorated ?f)
  )
)
