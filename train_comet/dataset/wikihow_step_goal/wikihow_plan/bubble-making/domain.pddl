(define (domain bubble-making-simple)
  (:requirements :strips :typing)

  (:types
    person tool material container bubble - object
    location
  )

  (:predicates
    ;; 位置相关谓词
    (in ?obj - object ?cont - container)
    (at_location ?obj - object ?loc - location)

    ;; 状态相关谓词
    (mixed ?mixture - material)
    (enhanced ?mixture - material)
    (have_wand ?p - person ?t - tool)
    (served_bubble ?b - bubble)
    (in_air ?b - bubble)
    (wet ?t - tool)
    (outside ?p - person)
  )

  ;; 动作1：混合肥皂和水
  (:action mix_soap_and_water
    :parameters (?p - person ?soap - material ?water - material ?bowl - container ?mixture - material)
    :precondition (and
      (in ?soap ?bowl)
      (in ?water ?bowl)
      (not (mixed ?mixture))
    )
    :effect (and
      (mixed ?mixture)
      (in ?mixture ?bowl)
      (not (in ?soap ?bowl))
      (not (in ?water ?bowl))
    )
  )

  ;; 动作2：增强泡泡溶液
  (:action enhance_solution
    :parameters (?p - person ?mixture - material)
    :precondition (and
      (mixed ?mixture)
      (not (enhanced ?mixture))
    )
    :effect (enhanced ?mixture)
  )

  ;; 动作3：制作泡泡棒
  (:action make_bubble_wand
    :parameters (?p - person ?wand - tool)
    :precondition (and
      (enhanced mixture1)
      (not (have_wand ?p ?wand))
    )
    :effect (have_wand ?p ?wand)
  )

  ;; 动作4：前往户外
  (:action go_outside
    :parameters (?p - person)
    :precondition (not (outside ?p))
    :effect (outside ?p)
  )

  ;; 动作5：制作肥皂泡泡
  (:action make_bubble
    :parameters (?p - person ?wand - tool ?b - bubble)
    :precondition (and
      (have_wand ?p ?wand)
      (enhanced mixture1)
      (outside ?p)
    )
    :effect (and
      (in_air ?b)
      (wet ?wand)
      (served_bubble ?b)
    )
  )
)
