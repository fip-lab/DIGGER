(define (problem put_Book1_to_Sofa3)
  (:domain put_task)
  (:objects
    Pillow1 - object
    CD1 - object
    Watch1 - object
    Book1 - object
    KeyChain1 - object
    CreditCard1 - object
    Laptop1 - object
    Box1 - receptacle_object
    CellPhone2 - object
    CellPhone1 - object
    Box4 - receptacle_object
    Sofa1 - receptacle
    Drawer1 - receptacle
    Box3 - receptacle_object
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Box2 - receptacle_object
    Sofa2 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Desk2)
    (objectAtLocation Book1 Desk1)
    (objectAtLocation Laptop1 Desk2)
    (objectAtLocation CellPhone2 Bed1)
    (objectAtLocation CD1 Drawer1)
    (objectAtLocation Pillow1 Sofa1)
    (objectAtLocation KeyChain1 Box1)
    (objectAtLocation Box1 Box2)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box3 Sofa2)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation Book1 Sofa3)
      (objectAtLocation KeyChain1 Sofa3)
      (not (objectAtLocation Book1 Box2))
      (not (objectAtLocation Book1 Box1))
      (not (objectAtLocation KeyChain1 Box2))
      (not (objectAtLocation KeyChain1 Box1))
    )
  )
)
