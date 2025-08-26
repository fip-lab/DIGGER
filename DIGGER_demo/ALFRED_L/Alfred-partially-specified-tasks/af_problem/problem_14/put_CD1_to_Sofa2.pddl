(define (problem put_CD1_to_Sofa2)
  (:domain put_task)
  (:objects
    Book2 - object
    Box2 - receptacle_object
    KeyChain2 - object
    CellPhone1 - object
    KeyChain1 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    KeyChain3 - object
    Pencil2 - object
    Box1 - receptacle_object
    Pencil1 - object
    CD1 - object
    Desk5 - receptacle
    Sofa1 - receptacle
    Sofa2 - receptacle
    Sofa3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Desk1 - receptacle
    Desk6 - receptacle
    GarbageCan1 - receptacle
    Box3 - receptacle_object
    Box4 - receptacle_object
  )

  (:init
    (atLocation agent1 Desk3)
    (objectAtLocation CD1 Desk2)
    (objectAtLocation Book2 Desk3)
    (objectAtLocation CreditCard1 Desk4)
    (objectAtLocation KeyChain1 Drawer1)
    (objectAtLocation KeyChain2 Desk5)
    (objectAtLocation Pencil1 GarbageCan1)
    (objectAtLocation Pencil2 Desk6)
    (objectAtLocation Pen1 Drawer2)
    (objectAtLocation CellPhone1 Sofa3)
    (objectAtLocation Book1 Box2)
    (objectAtLocation Box2 Box1)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box3 Sofa2)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation CD1 Sofa2)
      (objectAtLocation Book1 Sofa2)
      (not (objectAtLocation CD1 Box1))
      (not (objectAtLocation CD1 Box2))
      (not (objectAtLocation Book1 Box1))
      (not (objectAtLocation Book1 Box2))
    )
  )
)
