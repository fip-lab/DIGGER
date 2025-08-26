(define (problem move_Watch1_to_Box1_with_two_object_50)
  (:domain put_task)
  (:objects
    agent1 - agent
    CellPhone1 - object
    Box1 - receptacle
    Watch1 - object
    Watch2 - object
    Laptop1 - object
    KeyChain1 - object
    Pencil1 - object
    CellPhone2 - object
    CellPhone3 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    Bed1 - receptacle
    Drawer1 - receptacle
    Box2 - receptacle
    Sofa3 - receptacle
    Sofa2 - receptacle
    Sofa1 - receptacle
    Desk1 - receptacle
    GarbageCan1 - receptacle
    Drawer3 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Book2 - object
    Book3 - object
    Laptop2 - object
  )

  (:init
    (atLocation agent1 Bed1)
    (objectAtLocation Watch1 Drawer1)
    (objectAtLocation CellPhone1 Bed1)
    (objectAtLocation CellPhone2 Drawer2)
    (objectAtLocation Watch2 Desk1)
    (objectAtLocation KeyChain1 Drawer3)
    (objectAtLocation CellPhone3 Desk2)
    (objectAtLocation Laptop1 Sofa2)
    (objectAtLocation Pen1 GarbageCan1)
    (objectAtLocation CreditCard1 Sofa3)
    (objectAtLocation Laptop2 Drawer3)
    (objectAtLocation Book1 Box1)
    (objectAtLocation Book2 Box2)
    (objectAtLocation Book3 Box1)
  )

  (:goal
    (and
      (objectAtLocation Watch1 Box1)
    )
  )
)
