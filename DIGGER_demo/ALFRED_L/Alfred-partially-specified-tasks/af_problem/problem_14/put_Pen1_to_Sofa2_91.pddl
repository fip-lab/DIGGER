(define (problem put_Pen1_to_Sofa2_91)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    Box1 - receptacle_object
    Pen3 - object
    KeyChain2 - object
    CreditCard3 - object
    Watch2 - object
    CellPhone1 - object
    KeyChain1 - object
    Watch1 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    CellPhone2 - object
    CreditCard2 - object
    Pen2 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Box4 - receptacle_object
    Sofa3 - receptacle
    Box5 - receptacle_object
    Drawer1 - receptacle
    Drawer2 - receptacle
    Box3 - receptacle_object
    Desk2 - receptacle
    Sofa4 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Box2 - receptacle_object
    GarbageCan1 - receptacle
  )

  (:init
    (atLocation agent1 Drawer1)
    (objectAtLocation Pen1 Desk1)
    (objectAtLocation CreditCard1 Drawer1)
    (objectAtLocation Watch2 Drawer2)
    (objectAtLocation Pen2 GarbageCan1)
    (objectAtLocation KeyChain2 Sofa1)
    (objectAtLocation Book1 Sofa2)
    (objectAtLocation CreditCard2 Desk2)
    (objectAtLocation CellPhone1 Bed1)
    (objectAtLocation CellPhone2 Sofa3)
    (objectAtLocation KeyChain1 Box4)
    (objectAtLocation Box4 Box3)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box3 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation Pen1 Sofa2)
      (objectAtLocation KeyChain1 Sofa2)
      (not (objectAtLocation Pen1 Box3))
      (not (objectAtLocation Pen1 Box4))
      (not (objectAtLocation KeyChain1 Box3))
      (not (objectAtLocation KeyChain1 Box4))
    )
  )
)
