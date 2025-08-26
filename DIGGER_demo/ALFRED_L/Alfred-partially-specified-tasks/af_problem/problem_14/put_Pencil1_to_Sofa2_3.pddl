(define (problem put_Pencil1_to_Sofa2_3)
  (:domain put_task)
  (:objects
agent1 - agent    Pillow1 - object
    CD1 - object
    Pencil2 - object
    CreditCard3 - object
    Laptop2 - object
    CellPhone1 - object
    KeyChain1 - object
    Book1 - object
    CD2 - object
    CreditCard1 - object
    Laptop1 - object
    Box1 - receptacle_object
    CreditCard2 - object
    Pencil1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Sofa5 - receptacle
    Sofa3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Sofa4 - receptacle
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    AlarmClock1 - object
    Box3 - receptacle_object
    Box4 - receptacle_object
  )

  (:init
    (atLocation agent1 Bed1)
    (objectAtLocation Pencil1 GarbageCan1)
    (objectAtLocation Pillow1 Bed1)
    (objectAtLocation Book1 Sofa1)
    (objectAtLocation CD1 Desk2)
    (objectAtLocation Laptop1 Sofa2)
    (objectAtLocation CellPhone1 Sofa3)
    (objectAtLocation Laptop2 Desk3)
    (objectAtLocation Pencil2 Drawer1)
    (objectAtLocation CreditCard2 Drawer2)
    (objectAtLocation CreditCard3 Sofa4)
    (objectAtLocation KeyChain1 Sofa5)
    (objectAtLocation AlarmClock1 Box2)
    (objectAtLocation Box2 Box1)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box3 Sofa3)
    (objectAtLocation Box4 Sofa3)
  )

  (:goal
    (and
      (objectAtLocation Pencil1 Sofa2)
      (objectAtLocation AlarmClock1 Sofa2)
      (not (objectAtLocation Pencil1 Box1))
      (not (objectAtLocation Pencil1 Box2))
      (not (objectAtLocation AlarmClock1 Box1))
      (not (objectAtLocation AlarmClock1 Box2))
    )
  )
)
