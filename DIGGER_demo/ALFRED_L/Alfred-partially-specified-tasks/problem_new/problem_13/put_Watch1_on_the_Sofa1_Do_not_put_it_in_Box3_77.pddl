(define (problem put_Watch1_on_the_Sofa1_Do_not_put_it_in_Box3_77)
  (:domain put_task)
  (:objects
    agent1 - agent
    Box2 - receptacle
    AlarmClock1 - object
    CellPhone1 - object
    Watch1 - object
    KeyChain1 - object
    Book2 - object
    Pencil1 - object
    CD1 - object
    KeyChain2 - object
    CreditCard1 - object
    Book1 - object
    Pencil2 - object
    Book3 - object
    Box1 - receptacle
    Watch2 - object
    Desk1 - receptacle
    Desk3 - receptacle
    Sofa3 - receptacle
    Box3 - receptacle
    Sofa4 - receptacle
    Desk4 - receptacle
    Desk5 - receptacle
    Sofa1 - receptacle
    Desk6 - receptacle
    Desk2 - receptacle
    Box4 - receptacle
    Drawer1 - receptacle
    Sofa2 - receptacle
    Book4 - object
    Laptop1 - object
    Laptop2 - object
    Laptop3 - object
  )

  (:init
    (atLocation agent1 Sofa2)
    (objectAtLocation Watch1 Desk1)
    (objectAtLocation KeyChain2 Sofa1)
    (objectAtLocation CreditCard1 Sofa2)
    (objectAtLocation CD1 Desk2)
    (objectAtLocation Book2 Drawer1)
    (objectAtLocation CellPhone1 Desk4)
    (objectAtLocation Pencil1 Desk6)
    (objectAtLocation Book3 Sofa4)
    (objectAtLocation Book4 Sofa2)
    (objectAtLocation Laptop1 Sofa1)
    (objectAtLocation Laptop2 Sofa3)
    (objectAtLocation Laptop3 Desk1)
    (objectAtLocation Book1 Box4)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box2 Sofa2)
    (objectAtLocation Box3 Sofa1)
    (objectAtLocation Box4 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation Watch1 Sofa1)
      (not (objectAtLocation Watch1 Box3))
    )
  )
)
