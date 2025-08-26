(define (problem put_Laptop1_to_Sofa2_67)
  (:domain put_task)
  (:objects
agent1 - agent    Box1 - receptacle_object
    AlarmClock1 - object
    CD1 - object
    AlarmClock2 - object
    Watch1 - object
    Book1 - object
    KeyChain1 - object
    CD2 - object
    Pen1 - object
    CreditCard1 - object
    Laptop1 - object
    CellPhone2 - object
    CD3 - object
    CreditCard2 - object
    CellPhone1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Box4 - receptacle_object
    Drawer3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Box3 - receptacle_object
    Desk2 - receptacle
    Desk4 - receptacle
    Desk3 - receptacle
    Desk1 - receptacle
    Drawer4 - receptacle
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Drawer1)
    (objectAtLocation Laptop1 Desk1)
    (objectAtLocation CreditCard1 Drawer1)
    (objectAtLocation CellPhone2 Sofa2)
    (objectAtLocation CD1 GarbageCan1)
    (objectAtLocation Watch1 Drawer2)
    (objectAtLocation CD2 Desk3)
    (objectAtLocation KeyChain1 Drawer3)
    (objectAtLocation CD3 Drawer4)
    (objectAtLocation AlarmClock2 Desk4)
    (objectAtLocation Book1 Box3)
    (objectAtLocation Box3 Box2)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box2 Sofa2)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation Laptop1 Sofa2)
      (objectAtLocation Book1 Sofa2)
      (not (objectAtLocation Laptop1 Box2))
      (not (objectAtLocation Laptop1 Box3))
      (not (objectAtLocation Book1 Box2))
      (not (objectAtLocation Book1 Box3))
    )
  )
)
