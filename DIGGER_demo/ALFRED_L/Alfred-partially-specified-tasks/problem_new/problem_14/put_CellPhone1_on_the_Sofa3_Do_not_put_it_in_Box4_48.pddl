(define (problem put_CellPhone1_on_the_Sofa3_Do_not_put_it_in_Box4_48)
  (:domain put_task)
  (:objects
agent1 - agent    AlarmClock1 - object
    CellPhone1 - object
    Watch1 - object
    Book1 - object
    CD2 - object
    Pen1 - object
    CreditCard1 - object
    CellPhone2 - object
    Box1 - receptacle_object
    CD1 - object
    Sofa1 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    GarbageCan2 - receptacle
    Desk1 - receptacle
    GarbageCan1 - receptacle
    KeyChain1 - object
    Box2 - receptacle_object
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa2 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Sofa1)
    (objectAtLocation CellPhone1 Drawer1)
    (objectAtLocation CellPhone2 Sofa1)
    (objectAtLocation CD1 GarbageCan1)
    (objectAtLocation Pen1 GarbageCan2)
    (objectAtLocation CreditCard1 Desk1)
    (objectAtLocation Watch1 Drawer2)
    (objectAtLocation CD2 Desk2)
    (objectAtLocation AlarmClock1 Desk4)
    (objectAtLocation KeyChain1 Box1)
    (objectAtLocation Box1 Box4)
    (objectAtLocation Box2 Sofa2)
    (objectAtLocation Box3 Sofa2)
    (objectAtLocation Box4 Sofa3)
  )

  (:goal
    (and
      (objectAtLocation CellPhone1 Sofa3)
      (objectAtLocation KeyChain1 Sofa3)
      (not (objectAtLocation CellPhone1 Box4))
      (not (objectAtLocation CellPhone1 Box1))
      (not (objectAtLocation KeyChain1 Box4))
      (not (objectAtLocation KeyChain1 Box1))
    )
  )
)
