(define (problem put_KeyChain1_to_Sofa2_4)
  (:domain put_task)
  (:objects
agent1 - agent    Box1 - receptacle_object
    Pen2 - object
    Pillow1 - object
    AlarmClock1 - object
    CreditCard3 - object
    KeyChain1 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    Laptop1 - object
    CreditCard2 - object
    Box2 - receptacle_object
    CellPhone1 - object
    Desk5 - receptacle
    Sofa1 - receptacle
    Sofa2 - receptacle
    Sofa3 - receptacle
    Drawer1 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Sofa4 - receptacle
    Desk1 - receptacle
    GarbageCan1 - receptacle
    Box3 - receptacle_object
    Box4 - receptacle_object
  )

  (:init
    (atLocation agent1 GarbageCan1)
    (objectAtLocation KeyChain1 Drawer1)
    (objectAtLocation Pen1 GarbageCan1)
    (objectAtLocation Laptop1 Desk2)
    (objectAtLocation CreditCard2 Desk3)
    (objectAtLocation CellPhone1 Desk4)
    (objectAtLocation Book1 Sofa1)
    (objectAtLocation Pillow1 Sofa3)
    (objectAtLocation CreditCard3 Sofa4)
    (objectAtLocation AlarmClock1 Box3)
    (objectAtLocation Box3 Box1)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box4 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation KeyChain1 Sofa2)
      (objectAtLocation AlarmClock1 Sofa2)
      (not (objectAtLocation KeyChain1 Box1))
      (not (objectAtLocation KeyChain1 Box3))
      (not (objectAtLocation AlarmClock1 Box1))
      (not (objectAtLocation AlarmClock1 Box3))
    )
  )
)
