(define (problem grow_rose_bush)
  (:domain rose_bush_growing)
  
  (:objects 
    ground clipping - entity
  )
  
  (:init 
    (not (prepared ground))
    (not (cut clipping))
    (not (moistened clipping))
    (not (planted clipping))
  )
  
  (:goal 
    (and
      (planted clipping)
    )
  )
)