(define (problem put_CreditCard1_on_the_Sofa1_Do_not_put_it_in_Box1_44)
  (:domain put_task)
  (:objects
    agent1 - agent
    Pen1 - object
    CellPhone1 - object
    Laptop1 - object
    Book2 - object
    KeyChain1 - object
    Pencil1 - object
    CD1 - object
    Book1 - object
    CreditCard1 - object
    CD2 - object
    KeyChain2 - object
    Desk1 - receptacle
    Box2 - receptacle
    Sofa3 - receptacle
    Drawer2 - receptacle
    Box3 - receptacle
    Sofa4 - receptacle
    Box1 - receptacle
    Sofa1 - receptacle
    Drawer1 - receptacle
    Desk2 - receptacle
    Sofa2 - receptacle
    Laptop2 - object
    Laptop3 - object
    Laptop4 - object
    Book3 - object
    Box4 - receptacle
  )

  (:init
    (atLocation agent1 Sofa2)
    (objectAtLocation Book1 Sofa1)
    (objectAtLocation CreditCard1 Desk1)
    (objectAtLocation CellPhone1 Sofa2)
    (objectAtLocation KeyChain1 Drawer1)
    (objectAtLocation CD2 Drawer2)
    (objectAtLocation Laptop1 Sofa3)
    (objectAtLocation KeyChain2 Sofa4)
    (objectAtLocation Pen1 Desk2)
    (objectAtLocation Laptop3 Sofa4)
    (objectAtLocation Laptop4 Box1)
    (objectAtLocation Book2 Sofa3)
    (objectAtLocation Book3 Drawer1)
    (objectAtLocation Laptop2 Box4)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box3 Sofa3)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation CreditCard1 Sofa1)
      (not (objectAtLocation CreditCard1 Box1))
    )
  )
)
