(define (problem put_CD1_on_the_Sofa2_Do_not_put_it_in_Box3_2)
  (:domain put_task)
  (:objects
    agent1 - agent
    AlarmClock1 - object
    Box2 - receptacle
    KeyChain3 - object
    CellPhone1 - object
    KeyChain1 - object
    CreditCard2 - object
    CD1 - object
    KeyChain2 - object
    CreditCard1 - object
    CellPhone2 - object
    CD2 - object
    CellPhone3 - object
    Book1 - object
    Box1 - receptacle
    Desk1 - receptacle
    Sofa3 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    GarbageCan1 - receptacle
    Box3 - receptacle
    Drawer2 - receptacle
    Sofa4 - receptacle
    Sofa1 - receptacle
    Drawer1 - receptacle
    Box4 - receptacle
    Sofa2 - receptacle
    Book2 - object
    Book3 - object
    Book4 - object
    Laptop1 - object
    Laptop2 - object
    Laptop3 - object
  )

  (:init
    (atLocation agent1 Drawer1)
    (objectAtLocation CD1 GarbageCan1)
    (objectAtLocation CreditCard1 Drawer1)
    (objectAtLocation CellPhone1 Sofa1)
    (objectAtLocation CD2 Desk1)
    (objectAtLocation KeyChain2 Desk2)
    (objectAtLocation CellPhone3 Drawer2)
    (objectAtLocation Book1 Sofa2)
    (objectAtLocation KeyChain3 Sofa4)
    (objectAtLocation Book2 Desk3)
    (objectAtLocation Book4 Sofa1)
    (objectAtLocation Laptop1 Box3)
    (objectAtLocation Laptop2 Sofa4)
    (objectAtLocation Laptop3 Box3)
    (objectAtLocation Book3 Box1)
    (objectAtLocation Box1 Sofa3)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box3 Sofa2)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation CD1 Sofa2)
      (not (objectAtLocation CD1 Box3))
    )
  )
)
