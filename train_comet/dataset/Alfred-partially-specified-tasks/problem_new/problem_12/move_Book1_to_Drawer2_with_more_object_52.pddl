(define (problem move_Book1_to_Drawer2_with_more_object_52)
  (:domain put_task)
  (:objects
    agent1 - agent
    CellPhone1 - object
    Laptop2 - object
    Pen2 - object
    Book2 - object
    Watch1 - object
    Laptop1 - object
    Watch2 - object
    KeyChain1 - object
    CellPhone2 - object
    CD1 - object
    CD2 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    Drawer1 - receptacle
    Bed1 - receptacle
    Box1 - receptacle
    Box2 - receptacle
    Sofa4 - receptacle
    Box3 - receptacle
    Sofa3 - receptacle
    Sofa2 - receptacle
    Desk1 - receptacle
    Sofa1 - receptacle
    Box4 - receptacle
    GarbageCan1 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Pencil1 - object
    Pencil2 - object
    Pencil3 - object
    KeyChain2 - object
  )

  (:init
    (atLocation agent1 Sofa2)
    (objectAtLocation Book1 Sofa1)
    (objectAtLocation CellPhone2 Sofa2)
    (objectAtLocation CD1 Drawer1)
    (objectAtLocation Pen1 Desk1)
    (objectAtLocation KeyChain1 Sofa3)
    (objectAtLocation CD2 Desk2)
    (objectAtLocation Laptop1 Sofa4)
    (objectAtLocation Laptop2 Bed1)
    (objectAtLocation Pen2 GarbageCan1)
    (objectAtLocation Watch2 Drawer2)
    (objectAtLocation KeyChain2 Drawer2)
    (objectAtLocation Pencil3 Box1)
    (objectAtLocation Pencil1 Box1)
    (objectAtLocation Pencil2 Box2)
  )

  (:goal
    (and
      (objectAtLocation Book1 Drawer2)
    )
  )
)
