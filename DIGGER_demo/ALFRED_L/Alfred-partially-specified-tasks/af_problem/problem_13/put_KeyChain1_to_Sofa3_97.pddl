(define (problem put_KeyChain1_to_Sofa3_97)
  (:domain put_task)
  (:objects
    agent1 - agent
    Pen1 - object
    Box2 - receptacle
    CellPhone1 - object
    Laptop1 - object
    Book2 - object
    KeyChain1 - object
    Pencil1 - object
    CD1 - object
    Book1 - object
    CD2 - object
    Book3 - object
    Box1 - receptacle
    Laptop2 - object
    Desk1 - receptacle
    Desk3 - receptacle
    GarbageCan2 - receptacle
    Sofa3 - receptacle
    GarbageCan1 - receptacle
    Box3 - receptacle
    Desk4 - receptacle
    Sofa1 - receptacle
    Desk2 - receptacle
    Drawer1 - receptacle
    Sofa2 - receptacle
    Book4 - object
    Pencil2 - object
    Pencil3 - object
    Box4 - receptacle
  )

  (:init
    (atLocation agent1 GarbageCan1)
    (objectAtLocation KeyChain1 Desk1)
    (objectAtLocation Pencil1 GarbageCan1)
    (objectAtLocation Book2 Drawer1)
    (objectAtLocation Laptop1 Desk4)
    (objectAtLocation Laptop2 Sofa1)
    (objectAtLocation CD2 GarbageCan2)
    (objectAtLocation Book3 Sofa3)
    (objectAtLocation Book4 Sofa3)
    (objectAtLocation Pencil2 Box2)
    (objectAtLocation Pencil3 Desk1)
    (objectAtLocation Book1 Box3)
    (objectAtLocation Box1 Sofa3)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box3 Sofa2)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation KeyChain1 Sofa3)
      (not (objectAtLocation KeyChain1 Box1))
    )
  )
)
