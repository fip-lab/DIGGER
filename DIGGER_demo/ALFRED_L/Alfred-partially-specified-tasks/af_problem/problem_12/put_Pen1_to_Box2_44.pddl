(define (problem put_Pen1_to_Box2_44)
  (:domain put_task)
  (:objects
    agent1 - agent
    CellPhone1 - object
    Box1 - receptacle
    Laptop2 - object
    Book2 - object
    Pencil2 - object
    Laptop1 - object
    KeyChain1 - object
    Pencil1 - object
    CellPhone2 - object
    CD1 - object
    Pencil3 - object
    AlarmClock1 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    Drawer1 - receptacle
    Desk3 - receptacle
    Sofa4 - receptacle
    Box2 - receptacle
    GarbageCan2 - receptacle
    Sofa3 - receptacle
    Sofa2 - receptacle
    Desk4 - receptacle
    Desk1 - receptacle
    Sofa1 - receptacle
    GarbageCan1 - receptacle
    Desk5 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    KeyChain2 - object
    KeyChain3 - object
  )

  (:init
    (atLocation agent1 Sofa1)
    (objectAtLocation Pen1 GarbageCan1)
    (objectAtLocation Laptop1 Sofa1)
    (objectAtLocation CD1 GarbageCan2)
    (objectAtLocation Laptop2 Desk1)
    (objectAtLocation AlarmClock1 Desk2)
    (objectAtLocation CreditCard1 Desk3)
    (objectAtLocation Book1 Desk4)
    (objectAtLocation Pencil1 Drawer1)
    (objectAtLocation Book2 Drawer2)
    (objectAtLocation CellPhone1 Sofa4)
    (objectAtLocation Pencil2 Desk5)
    (objectAtLocation KeyChain1 Box2)
    (objectAtLocation KeyChain2 Box2)
    (objectAtLocation KeyChain3 Box1)
  )

  (:goal
    (and
      (objectAtLocation Pen1 Box2)
    )
  )
)
