(define (problem put_KeyChain1_to_Sofa2_91)
  (:domain put_task)
  (:objects
    agent1 - agent
    Pen1 - object
    CellPhone1 - object
    KeyChain1 - object
    Pencil1 - object
    CD1 - object
    Book1 - object
    CD2 - object
    CellPhone2 - object
    KeyChain2 - object
    Pen3 - object
    Box1 - receptacle
    Pen2 - object
    Desk1 - receptacle
    Box2 - receptacle
    Bed1 - receptacle
    GarbageCan2 - receptacle
    GarbageCan3 - receptacle
    GarbageCan1 - receptacle
    Drawer2 - receptacle
    Box3 - receptacle
    Sofa1 - receptacle
    Drawer1 - receptacle
    Sofa2 - receptacle
    Pencil2 - object
    Pencil3 - object
    Pencil4 - object
    Laptop1 - object
    Laptop2 - object
    Laptop3 - object
    Box4 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 GarbageCan1)
    (objectAtLocation KeyChain1 Drawer1)
    (objectAtLocation Pencil1 GarbageCan1)
    (objectAtLocation CellPhone1 Desk1)
    (objectAtLocation Pen1 Drawer2)
    (objectAtLocation CellPhone2 Bed1)
    (objectAtLocation CD1 GarbageCan2)
    (objectAtLocation KeyChain2 Sofa2)
    (objectAtLocation Pen3 GarbageCan3)
    (objectAtLocation Pencil2 GarbageCan2)
    (objectAtLocation Pencil3 Box1)
    (objectAtLocation Laptop1 Box3)
    (objectAtLocation Laptop2 Bed1)
    (objectAtLocation Laptop3 Sofa1)
    (objectAtLocation Pencil4 Box3)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box3 Sofa3)
    (objectAtLocation Box4 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation KeyChain1 Sofa2)
      (not (objectAtLocation KeyChain1 Box1))
    )
  )
)
