(define (problem put_AlarmClock1_to_GarbageCan1_43)
  (:domain put_task)
  (:objects
    agent1 - agent
    CellPhone1 - object
    Box1 - receptacle
    Book2 - object
    Pen2 - object
    Laptop1 - object
    Pencil1 - object
    KeyChain1 - object
    CreditCard2 - object
    Pen3 - object
    AlarmClock1 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    Drawer1 - receptacle
    Desk3 - receptacle
    Box2 - receptacle
    Box3 - receptacle
    Desk4 - receptacle
    Desk1 - receptacle
    Sofa1 - receptacle
    Box4 - receptacle
    GarbageCan1 - receptacle
    Desk5 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    KeyChain2 - object
    KeyChain3 - object
    Laptop2 - object
    Sofa2 - receptacle
  )

  (:init
    (atLocation agent1 Desk2)
    (objectAtLocation AlarmClock1 Desk1)
    (objectAtLocation CreditCard1 Desk2)
    (objectAtLocation Pen1 GarbageCan1)
    (objectAtLocation Pencil1 Drawer1)
    (objectAtLocation Laptop1 Desk4)
    (objectAtLocation Book1 Sofa1)
    (objectAtLocation Book2 Drawer2)
    (objectAtLocation Pen3 Desk5)
    (objectAtLocation Laptop2 GarbageCan1)
    (objectAtLocation KeyChain3 Box1)
    (objectAtLocation KeyChain2 Box1)
    (objectAtLocation KeyChain1 Box2)
  )

  (:goal
    (and
      (objectAtLocation AlarmClock1 GarbageCan1)
    )
  )
)
