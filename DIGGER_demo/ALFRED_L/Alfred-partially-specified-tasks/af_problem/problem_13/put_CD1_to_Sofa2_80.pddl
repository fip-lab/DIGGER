(define (problem put_CD1_to_Sofa2_80)
  (:domain put_task)
  (:objects
    agent1 - agent
    Pen1 - object
    Box2 - receptacle
    Laptop1 - object
    KeyChain1 - object
    Pencil1 - object
    CD1 - object
    Book1 - object
    KeyChain2 - object
    CD2 - object
    CreditCard1 - object
    Box1 - receptacle
    Pillow1 - object
    Desk1 - receptacle
    Bed1 - receptacle
    Desk3 - receptacle
    GarbageCan1 - receptacle
    Desk4 - receptacle
    Desk5 - receptacle
    Sofa1 - receptacle
    Desk2 - receptacle
    Drawer1 - receptacle
    Sofa2 - receptacle
    KeyChain3 - object
    KeyChain4 - object
    Laptop2 - object
    Laptop3 - object
    Box3 - receptacle
    Box4 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Desk2)
    (objectAtLocation CD1 Desk1)
    (objectAtLocation Laptop1 Desk2)
    (objectAtLocation Book1 Bed1)
    (objectAtLocation Pillow1 Sofa2)
    (objectAtLocation KeyChain2 Desk3)
    (objectAtLocation CreditCard1 Drawer1)
    (objectAtLocation Pen1 GarbageCan1)
    (objectAtLocation Pencil1 Desk5)
    (objectAtLocation KeyChain3 Desk2)
    (objectAtLocation KeyChain4 Drawer1)
    (objectAtLocation Laptop2 Desk2)
    (objectAtLocation Laptop3 Drawer1)
    (objectAtLocation KeyChain1 Box3)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box3 Sofa2)
    (objectAtLocation Box4 Sofa3)
  )

  (:goal
    (and
      (objectAtLocation CD1 Sofa2)
      (not (objectAtLocation CD1 Box3))
    )
  )
)
