(define (problem put_Pencil1_to_Sofa2_56)
  (:domain put_task)
  (:objects
agent1 - agent    Pen2 - object
    Pillow1 - object
    CD1 - object
    KeyChain2 - object
    KeyChain1 - object
    Book1 - object
    CD2 - object
    Pillow2 - object
    CreditCard1 - object
    Pen1 - object
    Box1 - receptacle_object
    CD3 - object
    Pencil1 - object
    CellPhone1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Box4 - receptacle_object
    Sofa3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Box3 - receptacle_object
    Desk2 - receptacle
    Bed1 - receptacle
    GarbageCan2 - receptacle
    Desk1 - receptacle
    Box2 - receptacle_object
    GarbageCan1 - receptacle
  )

  (:init
    (atLocation agent1 Desk1)
    (objectAtLocation Pencil1 GarbageCan1)
    (objectAtLocation CellPhone1 Desk1)
    (objectAtLocation CD1 GarbageCan2)
    (objectAtLocation Pillow1 Sofa1)
    (objectAtLocation Pillow2 Bed1)
    (objectAtLocation CD2 Drawer1)
    (objectAtLocation CreditCard1 Sofa3)
    (objectAtLocation Pen1 Drawer2)
    (objectAtLocation Book1 Sofa1)
    (objectAtLocation KeyChain1 Box2)
    (objectAtLocation Box2 Box3)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box3 Sofa2)
    (objectAtLocation Box4 Sofa3)
  )

  (:goal
    (and
      (objectAtLocation Pencil1 Sofa2)
      (objectAtLocation KeyChain1 Sofa2)
      (not (objectAtLocation Pencil1 Box3))
      (not (objectAtLocation Pencil1 Box2))
      (not (objectAtLocation KeyChain1 Box3))
      (not (objectAtLocation KeyChain1 Box2))
    )
  )
)
