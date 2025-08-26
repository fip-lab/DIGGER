(define (problem put_Book1_to_Sofa1_100)
  (:domain put_task)
  (:objects
    agent1 - agent
    Pen1 - object
    KeyChain3 - object
    CellPhone1 - object
    KeyChain1 - object
    Pencil1 - object
    CD1 - object
    Book1 - object
    CreditCard1 - object
    CellPhone2 - object
    Pencil2 - object
    KeyChain2 - object
    Box1 - receptacle
    Pen2 - object
    Pillow1 - object
    Sofa3 - receptacle
    Desk1 - receptacle
    Desk3 - receptacle
    Box2 - receptacle
    Drawer2 - receptacle
    Drawer3 - receptacle
    Sofa4 - receptacle
    Sofa5 - receptacle
    Desk4 - receptacle
    Sofa1 - receptacle
    Drawer1 - receptacle
    Desk2 - receptacle
    Sofa2 - receptacle
    Pencil3 - object
    Pencil4 - object
    Box3 - receptacle
    Box4 - receptacle
  )

  (:init
    (atLocation agent1 Sofa2)
    (objectAtLocation CreditCard1 Sofa1)
    (objectAtLocation Book1 Drawer1)
    (objectAtLocation CellPhone1 Sofa2)
    (objectAtLocation Pillow1 Sofa3)
    (objectAtLocation CD1 Desk1)
    (objectAtLocation Pen1 Desk2)
    (objectAtLocation KeyChain1 Desk3)
    (objectAtLocation Pencil1 Drawer2)
    (objectAtLocation Pen2 Drawer3)
    (objectAtLocation CellPhone2 Desk4)
    (objectAtLocation KeyChain2 Sofa5)
    (objectAtLocation Pencil2 Drawer2)
    (objectAtLocation Pencil3 Sofa1)
    (objectAtLocation KeyChain3 Sofa1)
    (objectAtLocation Pencil4 Box1)
    (objectAtLocation Box1 Sofa3)
    (objectAtLocation Box2 Sofa2)
    (objectAtLocation Box3 Sofa2)
    (objectAtLocation Box4 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation Book1 Sofa1)
      (not (objectAtLocation Book1 Box4))
    )
  )
)
