(define (problem put_CellPhone1_on_the_Sofa1_Do_not_put_it_in_Box3_19)
  (:domain put_task)
  (:objects
    agent1 - agent
    AlarmClock1 - object
    CellPhone1 - object
    Watch1 - object
    KeyChain1 - object
    Pillow2 - object
    Pencil1 - object
    CD3 - object
    CD1 - object
    Book1 - object
    CD2 - object
    CreditCard1 - object
    Box1 - receptacle
    Pillow1 - object
    Desk1 - receptacle
    Sofa3 - receptacle
    Bed1 - receptacle
    Box2 - receptacle
    Drawer2 - receptacle
    GarbageCan1 - receptacle
    Box3 - receptacle
    Drawer3 - receptacle
    Sofa1 - receptacle
    Desk2 - receptacle
    Drawer1 - receptacle
    Sofa2 - receptacle
    Laptop1 - object
    Laptop2 - object
    Laptop3 - object
    Laptop4 - object
    KeyChain2 - object
    KeyChain3 - object
    Box4 - receptacle
  )

  (:init
    (atLocation agent1 Desk2)
    (objectAtLocation Book1 Sofa1)
    (objectAtLocation CellPhone1 Desk1)
    (objectAtLocation CD1 Desk2)
    (objectAtLocation Pencil1 Drawer1)
    (objectAtLocation KeyChain1 Drawer2)
    (objectAtLocation Pillow1 Sofa2)
    (objectAtLocation Pillow2 Bed1)
    (objectAtLocation CD3 GarbageCan1)
    (objectAtLocation CreditCard1 Drawer3)
    (objectAtLocation Laptop1 Box3)
    (objectAtLocation Laptop3 Desk2)
    (objectAtLocation Laptop4 Bed1)
    (objectAtLocation KeyChain2 Desk1)
    (objectAtLocation KeyChain3 Desk2)
    (objectAtLocation Laptop2 Box2)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box3 Sofa1)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation CellPhone1 Sofa1)
      (not (objectAtLocation CellPhone1 Box3))
    )
  )
)
