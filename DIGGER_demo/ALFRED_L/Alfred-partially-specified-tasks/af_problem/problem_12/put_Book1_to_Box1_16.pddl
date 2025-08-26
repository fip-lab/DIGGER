(define (problem put_Book1_to_Box1_16)
  (:domain put_task)
  (:objects
    agent1 - agent
    CellPhone1 - object
    Box1 - receptacle
    Box2 - receptacle
    Watch1 - object
    Watch2 - object
    KeyChain1 - object
    Pencil1 - object
    CellPhone2 - object
    CD1 - object
    Book1 - object
    CreditCard1 - object
    Bed1 - receptacle
    Drawer1 - receptacle
    Desk3 - receptacle
    Sofa3 - receptacle
    Sofa2 - receptacle
    Desk4 - receptacle
    Desk1 - receptacle
    Sofa1 - receptacle
    Desk2 - receptacle
    Laptop1 - object
    Laptop2 - object
    Laptop3 - object
    KeyChain2 - object
  )

  (:init
    (atLocation agent1 Sofa1)
    (objectAtLocation Book1 Bed1)
    (objectAtLocation CellPhone1 Sofa1)
    (objectAtLocation CreditCard1 Desk1)
    (objectAtLocation Watch1 Desk2)
    (objectAtLocation KeyChain1 Sofa3)
    (objectAtLocation CD1 Desk4)
    (objectAtLocation CellPhone2 Drawer1)
    (objectAtLocation KeyChain2 Desk3)
    (objectAtLocation Laptop3 Box1)
    (objectAtLocation Laptop1 Box1)
    (objectAtLocation Laptop2 Box2)
  )

  (:goal
    (and
      (objectAtLocation Book1 Box1)
    )
  )
)
