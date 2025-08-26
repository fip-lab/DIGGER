(define (problem move_CellPhone1_to_Box1_with_three_object_24)
  (:domain put_task)
  (:objects
    agent1 - agent
    KeyChain1 - object
    KeyChain2 - object
    Book1 - object
    Laptop1 - object
    Book2 - object
    CreditCard1 - object
    Box1 - receptacle
    Pencil1 - object
    CellPhone1 - object
    Pen2 - object
    Pen1 - object
    Sofa2 - receptacle
    Drawer1 - receptacle
    Bed1 - receptacle
    Box2 - receptacle
    GarbageCan1 - receptacle
    Desk2 - receptacle
    Sofa1 - receptacle
    Desk3 - receptacle
    Desk1 - receptacle
    Drawer2 - receptacle
    KeyChain3 - object
    KeyChain4 - object
    KeyChain5 - object
    KeyChain6 - object
    Box3 - receptacle
  )

  (:init
    (atLocation agent1 GarbageCan1)
    (objectAtLocation CellPhone1 Bed1)
    (objectAtLocation Pen1 GarbageCan1)
    (objectAtLocation Book1 Desk1)
    (objectAtLocation Laptop1 Desk2)
    (objectAtLocation Book2 Sofa2)
    (objectAtLocation Pencil1 Drawer2)
    (objectAtLocation KeyChain2 Box1)
    (objectAtLocation KeyChain4 Box2)
    (objectAtLocation KeyChain3 Box3)
    (objectAtLocation KeyChain1 Box1)
    (objectAtLocation KeyChain6 Box2)
    (objectAtLocation KeyChain5 Box1)
  )

  (:goal
    (and
      (objectAtLocation CellPhone1 Box1)
    )
  )
)
