(define (problem move_Pencil1_to_Box2_with_more_object_45)
  (:domain put_task)
  (:objects
    agent1 - agent
    Box1 - receptacle
    Pen2 - object
    Pencil2 - object
    Watch1 - object
    Laptop1 - object
    Pencil1 - object
    CreditCard2 - object
    CD1 - object
    CD2 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    CreditCard3 - object
    Drawer1 - receptacle
    Bed1 - receptacle
    Box2 - receptacle
    Box3 - receptacle
    Desk3 - receptacle
    Sofa2 - receptacle
    Desk1 - receptacle
    Sofa1 - receptacle
    Box4 - receptacle
    Drawer3 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    KeyChain1 - object
    KeyChain2 - object
    KeyChain3 - object
  )

  (:init
    (atLocation agent1 Drawer1)
    (objectAtLocation Pencil1 Desk1)
    (objectAtLocation CreditCard2 Drawer1)
    (objectAtLocation Pen1 Drawer2)
    (objectAtLocation Pen2 Desk2)
    (objectAtLocation Laptop1 Bed1)
    (objectAtLocation CD2 Desk3)
    (objectAtLocation Pencil2 Drawer3)
    (objectAtLocation CreditCard3 Sofa2)
    (objectAtLocation KeyChain1 Box2)
    (objectAtLocation KeyChain3 Box2)
    (objectAtLocation KeyChain2 Box1)
  )

  (:goal
    (and
      (objectAtLocation Pencil1 Box2)
    )
  )
)
