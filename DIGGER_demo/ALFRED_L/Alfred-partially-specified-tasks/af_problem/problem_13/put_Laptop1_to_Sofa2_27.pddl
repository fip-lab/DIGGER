(define (problem put_Laptop1_to_Sofa2_27)
  (:domain put_task)
  (:objects
    agent1 - agent
    AlarmClock1 - object
    Box2 - receptacle
    CellPhone1 - object
    Laptop1 - object
    Watch1 - object
    Book2 - object
    AlarmClock2 - object
    Pencil1 - object
    Book1 - object
    Book3 - object
    CreditCard1 - object
    Box1 - receptacle
    Pillow1 - object
    Sofa2 - receptacle
    Desk1 - receptacle
    Bed1 - receptacle
    Desk3 - receptacle
    Bed2 - receptacle
    Sofa3 - receptacle
    Desk4 - receptacle
    Sofa1 - receptacle
    Desk2 - receptacle
    Drawer1 - receptacle
    Desk5 - receptacle
    KeyChain1 - object
    KeyChain2 - object
    KeyChain3 - object
    KeyChain4 - object
    Pencil2 - object
    Pencil3 - object
    Box3 - receptacle
    Box4 - receptacle
  )

  (:init
    (atLocation agent1 Desk1)
    (objectAtLocation Laptop1 Bed1)
    (objectAtLocation Watch1 Desk1)
    (objectAtLocation CellPhone1 Desk2)
    (objectAtLocation Book1 Desk3)
    (objectAtLocation Book2 Drawer1)
    (objectAtLocation Book3 Bed2)
    (objectAtLocation AlarmClock2 Desk5)
    (objectAtLocation CreditCard1 Sofa2)
    (objectAtLocation Pillow1 Sofa3)
    (objectAtLocation KeyChain1 Sofa2)
    (objectAtLocation KeyChain2 Desk5)
    (objectAtLocation KeyChain3 Desk1)
    (objectAtLocation Pencil1 Desk1)
    (objectAtLocation Pencil2 Drawer1)
    (objectAtLocation Pencil3 Box1)
    (objectAtLocation KeyChain4 Box2)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box3 Sofa1)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation Laptop1 Sofa2)
      (not (objectAtLocation Laptop1 Box1))
    )
  )
)
