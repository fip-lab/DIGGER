(define (problem freeze-biscuits-cookies)
  (:domain freezing-biscuits-cookies)
  
  (:objects
    cookies - item
    baking-paper - item
    bowl - item
    freezer - item
    tray - item
  )
  
  (:init
    (not (in-container cookies))
    (airtight-container bowl)
    (not (in-lined-tin cookies))
    (not (in-freezer cookies))
    (not (thawed cookies))
  )
  
  (:goal
    (and
      (thawed cookies)
    )
  )
)