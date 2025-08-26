(define (problem move_Pillow1_to_Box1_with_more_object_12)
  (:domain put_task)
  (:objects
    agent1 - agent
    CellPhone1 - object
    Laptop2 - object
    Laptop1 - object
    Pillow1 - object
    KeyChain1 - object
    Pencil1 - object
    CD1 - object
    KeyChain3 - object
    KeyChain2 - object
    Pen1 - object
    CreditCard1 - object
    Bed1 - receptacle
    Drawer1 - receptacle
    Box2 - receptacle
    Box1 - receptacle
    Desk3 - receptacle
    Sofa2 - receptacle
    Desk4 - receptacle
    Desk1 - receptacle
    Sofa1 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Book1 - object
    Book2 - object
    Book3 - object
  )

  (:init
    (atLocation agent1 Desk1)
    (objectAtLocation Pillow1 Sofa1)
    (objectAtLocation Laptop1 Desk1)
    (objectAtLocation KeyChain2 Desk2)
    (objectAtLocation Laptop2 Bed1)
    (objectAtLocation KeyChain3 Drawer1)
    (objectAtLocation CellPhone1 Drawer2)
    (objectAtLocation Pen1 Desk3)
    (objectAtLocation CD1 Desk4)
    (objectAtLocation CreditCard1 Sofa2)
    (objectAtLocation Book1 Box1)
    (objectAtLocation Book2 Box2)
    (objectAtLocation Book3 Box1)
  )

  (:goal
    (and
      (objectAtLocation Pillow1 Box1)
    )
  )
)
