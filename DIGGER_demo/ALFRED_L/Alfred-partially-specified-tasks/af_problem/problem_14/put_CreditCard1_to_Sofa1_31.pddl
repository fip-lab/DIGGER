(define (problem put_CreditCard1_to_Sofa1_31)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    KeyChain2 - object
    KeyChain1 - object
    Book1 - object
    Watch1 - object
    CreditCard1 - object
    KeyChain3 - object
    Laptop1 - object
    Box1 - receptacle_object
    Pencil1 - object
    CD1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Drawer3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    Box2 - receptacle_object
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Sofa1)
    (objectAtLocation CreditCard1 Desk1)
    (objectAtLocation KeyChain1 Sofa1)
    (objectAtLocation CD1 Drawer1)
    (objectAtLocation Laptop1 Bed2)
    (objectAtLocation Pencil1 Drawer2)
    (objectAtLocation KeyChain3 Drawer3)
    (objectAtLocation Watch1 Desk2)
    (objectAtLocation Book2 Desk3)
    (objectAtLocation Book1 Box3)
    (objectAtLocation Box3 Box2)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation CreditCard1 Sofa1)
      (objectAtLocation Book1 Sofa1)
      (not (objectAtLocation CreditCard1 Box2))
      (not (objectAtLocation CreditCard1 Box3))
      (not (objectAtLocation Book1 Box2))
      (not (objectAtLocation Book1 Box3))
    )
  )
)
