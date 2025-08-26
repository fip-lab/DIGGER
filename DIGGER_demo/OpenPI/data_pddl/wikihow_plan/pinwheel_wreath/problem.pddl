(define (problem make-pinwheel-wreath)
  (:domain pinwheel-wreath)
  (:objects
    p1 - paper
    w1 - wreath
    pw1  - pinwheel
    t1 - twine
  )

  (:init
    ;;     ：
    (not (selected p1))
    (not (knowledge p1))
    (has-shape p1)
    (not (made pw1))
    (not (attached pw1))
    (not (base-chosen w1))
    (not (twine-attached t1))
    (not (twine-located t1))
  )

  (:goal
    (and
      ;;     ：
      (selected p1)
      (knowledge p1)
      (has-shape p1)

      ;;
      (made pw1)
      (attached pw1)

      ;;
      (base-chosen w1)

      ;;   /
      (twine-attached t1)
      (twine-located t1)
    )
  )
)
