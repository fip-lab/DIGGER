(define (problem put_Book1_to_Bed1_60)
  (:domain put_task)
  (:objects
    agent1 - agent
    CellPhone1 - object
    Box1 - receptacle
    Book2 - object
    Pencil2 - object
    Watch1 - object
    Pencil1 - object
    KeyChain1 - object
    CellPhone2 - object
    CD1 - object
    CellPhone3 - object
    Book1 - object
    Bed1 - receptacle
    Drawer1 - receptacle
    Box2 - receptacle
    Sofa3 - receptacle
    Sofa2 - receptacle
    Bed2 - receptacle
    Sofa1 - receptacle
    Desk1 - receptacle
    GarbageCan1 - receptacle
    Drawer2 - receptacle
    Pencil3 - object
    Laptop1 - object
    Laptop2 - object
  )

  (:init
    (atLocation agent1 Sofa2)
    (objectAtLocation Book1 Drawer1)
    (objectAtLocation CellPhone1 Bed1)
    (objectAtLocation CellPhone2 Sofa2)
    (objectAtLocation KeyChain1 Sofa3)
    (objectAtLocation Book2 Bed2)
    (objectAtLocation CellPhone3 Desk1)
    (objectAtLocation CD1 Drawer2)
    (objectAtLocation Laptop1 Bed1)
    (objectAtLocation Laptop2 GarbageCan1)
    (objectAtLocation Pencil1 Box2)
    (objectAtLocation Pencil3 Box2)
    (objectAtLocation Pencil2 Box1)
  )

  (:goal
    (and
      (objectAtLocation Book1 Bed1)
    )
  )
)
