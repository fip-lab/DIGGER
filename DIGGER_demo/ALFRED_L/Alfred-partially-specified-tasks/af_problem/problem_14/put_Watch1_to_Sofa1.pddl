(define (problem put_Watch1_to_Sofa1)
  (:domain put_task)
  (:objects
    Book2 - object
    AlarmClock1 - object
    CD1 - object
    Watch2 - object
    Watch1 - object
    KeyChain1 - object
    Book1 - object
    CD2 - object
    CreditCard1 - object
    Box1 - receptacle_object
    Pencil1 - object
    CellPhone1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Drawer3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Drawer4 - receptacle
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Desk2)
    (objectAtLocation Watch1 Desk1)
    (objectAtLocation AlarmClock1 Desk2)
    (objectAtLocation CD1 GarbageCan1)
    (objectAtLocation CellPhone1 Sofa2)
    (objectAtLocation CreditCard1 Drawer1)
    (objectAtLocation Watch2 Drawer2)
    (objectAtLocation Pencil1 Drawer4)
    (objectAtLocation Book2 Bed1)
    (objectAtLocation KeyChain1 Box4)
    (objectAtLocation Box4 Box2)
    (objectAtLocation Box1 Sofa3)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box3 Sofa3)
  )

  (:goal
    (and
      (objectAtLocation Watch1 Sofa1)
      (objectAtLocation KeyChain1 Sofa1)
      (not (objectAtLocation Watch1 Box2))
      (not (objectAtLocation Watch1 Box4))
      (not (objectAtLocation KeyChain1 Box2))
      (not (objectAtLocation KeyChain1 Box4))
    )
  )
)
