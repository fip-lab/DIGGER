(define (problem make-pineapple-sherbet)
  (:domain pineapple-sherbet)

  (:objects
      pineapple milk oil sugar extract - ingredient
      mixture - mixture
      sherbet - sherbet
      blender - appliance
      dish plate - container
      freezer kitchen - location
  )

  (:init
      (at pineapple kitchen)
      (at milk kitchen)
      (at oil kitchen)
      (at sugar kitchen)
      (at extract kitchen)
      (at blender kitchen)
      (at dish kitchen)
      (at plate kitchen)
      (at freezer kitchen)

      (is-fresh pineapple)
      (state blender off)
  )

  (:goal
      (and (in sherbet plate))
  )
)
