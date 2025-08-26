(define (problem move_Laptop1_to_Box1_with_more_object_77)
  (:domain put_task)
  (:objects
    agent1 - agent
    CellPhone1 - object
    Box1 - receptacle
    Box2 - receptacle
    Laptop1 - object
    Pillow1 - object
    KeyChain1 - object
    Pencil1 - object
    CellPhone2 - object
    CD1 - object
    KeyChain2 - object
    AlarmClock1 - object
    Book1 - object
    CreditCard1 - object
    Drawer1 - receptacle
    Bed1 - receptacle
    Desk3 - receptacle
    Sofa2 - receptacle
    Desk4 - receptacle
    Bed2 - receptacle
    Desk1 - receptacle
    Sofa1 - receptacle
    Desk5 - receptacle
    Desk6 - receptacle
    Desk2 - receptacle
    Book2 - object
    Book3 - object
    Laptop2 - object
  )

  (:init
    (atLocation agent1 Desk1)
    (objectAtLocation Laptop1 Sofa1)
    (objectAtLocation CD1 Desk1)
    (objectAtLocation KeyChain1 Drawer1)
    (objectAtLocation CellPhone1 Desk2)
    (objectAtLocation KeyChain2 Desk3)
    (objectAtLocation CreditCard1 Desk4)
    (objectAtLocation CellPhone2 Bed1)
    (objectAtLocation Pencil1 Desk5)
    (objectAtLocation Pillow1 Bed2)
    (objectAtLocation Laptop2 Sofa2)
    (objectAtLocation Book1 Box2)
    (objectAtLocation Book3 Box1)
    (objectAtLocation Book2 Box1)
  )

  (:goal
    (and
      (objectAtLocation Laptop1 Box1)
    )
  )
)
