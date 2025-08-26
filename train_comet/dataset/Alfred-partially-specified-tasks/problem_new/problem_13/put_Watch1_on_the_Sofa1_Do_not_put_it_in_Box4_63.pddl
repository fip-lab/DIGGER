(define (problem put_Watch1_on_the_Sofa1_Do_not_put_it_in_Box4_63)
  (:domain put_task)
  (:objects
    agent1 - agent
    Pen1 - object
    AlarmClock1 - object
    CellPhone1 - object
    Watch1 - object
    KeyChain1 - object
    Pencil1 - object
    CreditCard2 - object
    CD1 - object
    Book1 - object
    CreditCard1 - object
    CellPhone2 - object
    Pencil2 - object
    Box1 - receptacle
    Pen2 - object
    Desk1 - receptacle
    Box2 - receptacle
    Desk3 - receptacle
    GarbageCan2 - receptacle
    GarbageCan1 - receptacle
    Box3 - receptacle
    Desk4 - receptacle
    Sofa1 - receptacle
    Desk2 - receptacle
    Box4 - receptacle
    Drawer1 - receptacle
    Desk5 - receptacle
    Box5 - receptacle
    Book2 - object
    Book3 - object
    Book4 - object
    Pencil3 - object
    Sofa2 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Desk2)
    (objectAtLocation Watch1 Desk1)
    (objectAtLocation CellPhone1 Desk2)
    (objectAtLocation CreditCard1 Sofa1)
    (objectAtLocation CD1 GarbageCan1)
    (objectAtLocation KeyChain1 Desk4)
    (objectAtLocation Pencil2 GarbageCan2)
    (objectAtLocation Pen1 Drawer1)
    (objectAtLocation AlarmClock1 Desk5)
    (objectAtLocation Book2 Box3)
    (objectAtLocation Book3 Desk2)
    (objectAtLocation Book4 Drawer1)
    (objectAtLocation Pencil1 Desk4)
    (objectAtLocation Pencil3 Desk4)
    (objectAtLocation Book1 Box4)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box3 Sofa3)
    (objectAtLocation Box4 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation Watch1 Sofa1)
      (not (objectAtLocation Watch1 Box4))
    )
  )
)
