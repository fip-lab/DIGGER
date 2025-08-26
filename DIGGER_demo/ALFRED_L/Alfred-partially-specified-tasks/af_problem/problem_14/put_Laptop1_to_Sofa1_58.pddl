(define (problem put_Laptop1_to_Sofa1_58)
  (:domain put_task)
  (:objects
agent1 - agent    Pillow1 - object
    AlarmClock1 - object
    KeyChain2 - object
    CellPhone1 - object
    KeyChain1 - object
    Watch1 - object
    Book1 - object
    CD2 - object
    Pen1 - object
    CreditCard1 - object
    Laptop1 - object
    Box1 - receptacle_object
    CD3 - object
    CD1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Drawer3 - receptacle
    Bed3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    GarbageCan1 - receptacle
    Pencil1 - object
    Box2 - receptacle_object
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 GarbageCan1)
    (objectAtLocation Laptop1 Bed1)
    (objectAtLocation CD1 GarbageCan1)
    (objectAtLocation Watch1 Drawer1)
    (objectAtLocation KeyChain1 Sofa1)
    (objectAtLocation CellPhone1 Desk1)
    (objectAtLocation CD2 Drawer2)
    (objectAtLocation Pillow1 Bed2)
    (objectAtLocation CD3 Desk2)
    (objectAtLocation AlarmClock1 Desk3)
    (objectAtLocation Pen1 Drawer3)
    (objectAtLocation CreditCard1 Desk4)
    (objectAtLocation Pencil1 Box1)
    (objectAtLocation Book1 Box3)
    (objectAtLocation Box3 Box4)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box2 Sofa2)
    (objectAtLocation Box4 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation Laptop1 Sofa1)
      (objectAtLocation Book1 Sofa1)
      (not (objectAtLocation Laptop1 Box4))
      (not (objectAtLocation Laptop1 Box3))
      (not (objectAtLocation Book1 Box4))
      (not (objectAtLocation Book1 Box3))
    )
  )
)
