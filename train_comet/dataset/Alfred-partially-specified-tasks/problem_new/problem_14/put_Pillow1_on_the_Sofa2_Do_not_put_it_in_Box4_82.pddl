(define (problem put_Pillow1_on_the_Sofa2_Do_not_put_it_in_Box4_82)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    Pen2 - object
    Pillow1 - object
    CD1 - object
    AlarmClock1 - object
    CreditCard1 - object
    Watch1 - object
    KeyChain1 - object
    Book1 - object
    CD2 - object
    Pillow2 - object
    Pen1 - object
    Pencil1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Box4 - receptacle_object
    Sofa3 - receptacle
    Box5 - receptacle_object
    Box3 - receptacle_object
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Box1 - receptacle_object
    Box2 - receptacle_object
    GarbageCan1 - receptacle
  )

  (:init
    (atLocation agent1 Desk1)
    (objectAtLocation Pillow1 Sofa1)
    (objectAtLocation Watch1 Desk1)
    (objectAtLocation KeyChain1 Sofa2)
    (objectAtLocation Pencil1 Desk2)
    (objectAtLocation Pillow2 Bed1)
    (objectAtLocation Book2 Sofa3)
    (objectAtLocation Pen2 GarbageCan1)
    (objectAtLocation CD2 Desk3)
    (objectAtLocation Book1 Box2)
    (objectAtLocation Box2 Box4)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box3 Sofa2)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation Pillow1 Sofa2)
      (objectAtLocation Book1 Sofa2)
      (not (objectAtLocation Pillow1 Box4))
      (not (objectAtLocation Pillow1 Box2))
      (not (objectAtLocation Book1 Box4))
      (not (objectAtLocation Book1 Box2))
    )
  )
)
