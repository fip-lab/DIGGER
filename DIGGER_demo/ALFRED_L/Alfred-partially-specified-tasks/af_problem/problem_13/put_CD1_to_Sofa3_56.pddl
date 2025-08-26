(define (problem put_CD1_to_Sofa3_56)
  (:domain put_task)
  (:objects
    agent1 - agent
    Box2 - receptacle
    CellPhone1 - object
    Laptop1 - object
    Book2 - object
    KeyChain1 - object
    Watch1 - object
    CD1 - object
    Book1 - object
    CD2 - object
    CreditCard1 - object
    Box1 - receptacle
    Pillow1 - object
    Desk1 - receptacle
    Bed1 - receptacle
    Desk3 - receptacle
    Sofa3 - receptacle
    GarbageCan1 - receptacle
    Drawer2 - receptacle
    Drawer3 - receptacle
    Sofa1 - receptacle
    Desk2 - receptacle
    Drawer1 - receptacle
    Sofa2 - receptacle
    Laptop2 - object
    Laptop3 - object
    Laptop4 - object
    Pencil1 - object
    Pencil2 - object
    Pencil3 - object
    Box3 - receptacle
    Box4 - receptacle
  )

  (:init
    (atLocation agent1 Bed1)
    (objectAtLocation CD1 GarbageCan1)
    (objectAtLocation Pillow1 Bed1)
    (objectAtLocation Book1 Desk2)
    (objectAtLocation CD2 Drawer1)
    (objectAtLocation KeyChain1 Drawer2)
    (objectAtLocation CellPhone1 Desk3)
    (objectAtLocation Book2 Sofa2)
    (objectAtLocation CreditCard1 Drawer3)
    (objectAtLocation Laptop1 Sofa3)
    (objectAtLocation Laptop3 Sofa1)
    (objectAtLocation Laptop4 GarbageCan1)
    (objectAtLocation Pencil1 Drawer1)
    (objectAtLocation Pencil2 Desk3)
    (objectAtLocation Pencil3 Sofa1)
    (objectAtLocation Laptop2 Box4)
    (objectAtLocation Box1 Sofa3)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box3 Sofa2)
    (objectAtLocation Box4 Sofa3)
  )

  (:goal
    (and
      (objectAtLocation CD1 Sofa3)
      (not (objectAtLocation CD1 Box1))
    )
  )
)
