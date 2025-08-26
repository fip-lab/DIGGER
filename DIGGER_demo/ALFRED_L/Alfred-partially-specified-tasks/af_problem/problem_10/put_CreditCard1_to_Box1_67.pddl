(define (problem put_CreditCard1_to_Box1_67)
  (:domain put_task)
  (:objects
    agent1 - agent
    CellPhone1 - object
    Box1 - receptacle
    Watch1 - object
    Laptop1 - object
    Pencil1 - object
    KeyChain1 - object
    CellPhone2 - object
    CD1 - object
    CD2 - object
    CreditCard1 - object
    Drawer1 - receptacle
    Bed1 - receptacle
    Drawer4 - receptacle
    Desk1 - receptacle
    Sofa1 - receptacle
    GarbageCan1 - receptacle
    Drawer3 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Book1 - object
    Book2 - object
    Book3 - object
    Laptop2 - object
    Box2 - receptacle
    Sofa2 - receptacle
  )

  (:init
    (atLocation agent1 GarbageCan1)
    (objectAtLocation CreditCard1 Drawer1)
    (objectAtLocation Pencil1 GarbageCan1)
    (objectAtLocation CD1 Drawer2)
    (objectAtLocation CD2 Desk1)
    (objectAtLocation Laptop1 Bed1)
    (objectAtLocation CellPhone1 Drawer3)
    (objectAtLocation KeyChain1 Drawer4)
    (objectAtLocation CellPhone2 Desk2)
    (objectAtLocation Laptop2 Bed1)
    (objectAtLocation Book3 Box1)
    (objectAtLocation Book2 Box1)
    (objectAtLocation Book1 Box2)
  )

  (:goal
    (and
      (objectAtLocation CreditCard1 Box1)
    )
  )
)
