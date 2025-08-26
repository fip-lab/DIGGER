(define (problem put_KeyChain1_to_Sofa2_71)
  (:domain put_task)
  (:objects
agent1 - agent    Pen2 - object
    Pillow1 - object
    CD1 - object
    KeyChain2 - object
    Laptop1 - object
    Laptop2 - object
    KeyChain1 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    Pencil2 - object
    Pencil1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Drawer1 - receptacle
    Box3 - receptacle_object
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    Box1 - receptacle_object
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    AlarmClock1 - object
    Box4 - receptacle_object
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 GarbageCan1)
    (objectAtLocation KeyChain1 Desk1)
    (objectAtLocation Pen1 GarbageCan1)
    (objectAtLocation KeyChain2 Sofa2)
    (objectAtLocation Pen2 Drawer1)
    (objectAtLocation Pencil2 Desk2)
    (objectAtLocation Laptop1 Bed1)
    (objectAtLocation Laptop2 Desk3)
    (objectAtLocation Pillow1 Bed2)
    (objectAtLocation AlarmClock1 Bed2)
    (objectAtLocation Book1 Box4)
    (objectAtLocation Box4 Box2)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box2 Sofa2)
    (objectAtLocation Box3 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation KeyChain1 Sofa2)
      (objectAtLocation Book1 Sofa2)
      (not (objectAtLocation KeyChain1 Box2))
      (not (objectAtLocation KeyChain1 Box4))
      (not (objectAtLocation Book1 Box2))
      (not (objectAtLocation Book1 Box4))
    )
  )
)
