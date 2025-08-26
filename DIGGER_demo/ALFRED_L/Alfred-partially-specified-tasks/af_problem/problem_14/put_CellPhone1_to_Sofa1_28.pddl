(define (problem put_CellPhone1_to_Sofa1_28)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    AlarmClock1 - object
    CD1 - object
    Laptop2 - object
    CellPhone1 - object
    KeyChain1 - object
    Book1 - object
    Watch1 - object
    CD2 - object
    CreditCard1 - object
    Laptop1 - object
    Box1 - receptacle_object
    CellPhone2 - object
    Pencil1 - object
    Desk5 - receptacle
    Sofa1 - receptacle
    Sofa2 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    Box2 - receptacle_object
    Desk6 - receptacle
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Desk2)
    (objectAtLocation CellPhone1 Sofa1)
    (objectAtLocation Pencil1 Desk2)
    (objectAtLocation KeyChain1 Desk3)
    (objectAtLocation CD1 Drawer1)
    (objectAtLocation Laptop1 Desk4)
    (objectAtLocation Book2 Drawer2)
    (objectAtLocation Watch1 Desk5)
    (objectAtLocation CellPhone2 Bed1)
    (objectAtLocation Laptop2 Bed2)
    (objectAtLocation CD2 Desk6)
    (objectAtLocation CreditCard1 Sofa2)
    (objectAtLocation AlarmClock1 Box2)
    (objectAtLocation Box2 Box1)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box3 Sofa2)
    (objectAtLocation Box4 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation CellPhone1 Sofa1)
      (objectAtLocation AlarmClock1 Sofa1)
      (not (objectAtLocation CellPhone1 Box1))
      (not (objectAtLocation CellPhone1 Box2))
      (not (objectAtLocation AlarmClock1 Box1))
      (not (objectAtLocation AlarmClock1 Box2))
    )
  )
)
