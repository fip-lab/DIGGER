(define (problem make_chinese_macaroni)
  (:domain chinese_macaroni)

  (:objects
    macaroni - ingredient
    pot pan plate - container
    kitchen sink dining_table - location
  )

  (:init
    ;;
    (at macaroni kitchen)
    (at pot kitchen)
    (at pan kitchen)
    (at plate dining_table)

    ;;
    (not (cooked macaroni))
    (not (cooled macaroni))
    (not (seasoned macaroni))
    (not (served macaroni))
  )

  (:goal (and
    (in macaroni plate)
    (served macaroni)
  ))
)
