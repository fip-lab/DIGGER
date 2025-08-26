(define (problem put_Pillow1_to_Sofa3)
  (:domain put_task)
  (:objects
    Book2 - object
    Pillow1 - object
    AlarmClock1 - object
    KeyChain1 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    Box1 - receptacle_object
    CreditCard2 - object
    CD1 - object
    Sofa1 - receptacle
    Box3 - receptacle_object
    Desk2 - receptacle
    Desk4 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    Box4 - receptacle_object
    Sofa2 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Bed1)
    (objectAtLocation Pillow1 Sofa1)
    (objectAtLocation Book1 Bed1)
    (objectAtLocation CD1 GarbageCan1)
    (objectAtLocation CreditCard2 Desk2)
    (objectAtLocation Book2 Desk3)
    (objectAtLocation AlarmClock1 Desk4)
    (objectAtLocation KeyChain1 Box4)
    (objectAtLocation Box4 Box2)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box3 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation Pillow1 Sofa3)
      (objectAtLocation KeyChain1 Sofa3)
      (not (objectAtLocation Pillow1 Box2))
      (not (objectAtLocation Pillow1 Box4))
      (not (objectAtLocation KeyChain1 Box2))
      (not (objectAtLocation KeyChain1 Box4))
    )
  )
)
