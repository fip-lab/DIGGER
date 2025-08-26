(define (problem move_Pen1_to_Box1_with_three_object_82)
  (:domain put_task)
  (:objects
    agent1 - agent
    AlarmClock1 - object
    Box2 - receptacle
    Laptop1 - object
    CD1 - object
    Watch1 - object
    CreditCard1 - object
    Box1 - receptacle
    Pen3 - object
    Watch2 - object
    Pencil1 - object
    CellPhone1 - object
    Pen2 - object
    Pen1 - object
    CD2 - object
    Sofa2 - receptacle
    Drawer1 - receptacle
    Bed1 - receptacle
    Desk2 - receptacle
    Drawer4 - receptacle
    Sofa1 - receptacle
    Desk3 - receptacle
    Desk1 - receptacle
    Desk4 - receptacle
    Drawer3 - receptacle
    Drawer2 - receptacle
    Desk5 - receptacle
    Book1 - object
    Book2 - object
    Book3 - object
    Book4 - object
    Book5 - object
    Book6 - object
    KeyChain1 - object
    KeyChain2 - object
    Box3 - receptacle
  )

  (:init
    (atLocation agent1 Drawer1)
    (objectAtLocation Pen1 Desk2)
    (objectAtLocation Pen2 Drawer1)
    (objectAtLocation CD1 Desk3)
    (objectAtLocation Laptop1 Bed1)
    (objectAtLocation CreditCard1 Drawer2)
    (objectAtLocation Watch2 Desk4)
    (objectAtLocation CD2 Drawer3)
    (objectAtLocation Pencil1 Drawer4)
    (objectAtLocation CellPhone1 Sofa2)
    (objectAtLocation AlarmClock1 Desk5)
    (objectAtLocation KeyChain1 Bed1)
    (objectAtLocation KeyChain2 Desk5)
    (objectAtLocation Book3 Box2)
    (objectAtLocation Book4 Box3)
    (objectAtLocation Book5 Box1)
    (objectAtLocation Book6 Box3)
    (objectAtLocation Book2 Box1)
    (objectAtLocation Book1 Box1)
  )

  (:goal
    (and
      (objectAtLocation Pen1 Box1)
    )
  )
)
