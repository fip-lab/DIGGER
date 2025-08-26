(define (problem put_Laptop1_to_Sofa3)
  (:domain put_task)
  (:objects
    Book2 - object
    Pillow1 - object
    CD1 - object
    Pencil1 - object
    Laptop2 - object
    Watch1 - object
    Book1 - object
    CreditCard2 - object
    Pillow2 - object
    CreditCard1 - object
    Pen1 - object
    Laptop1 - object
    Box1 - receptacle_object
    Box2 - receptacle_object
    CellPhone1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Desk5 - receptacle
    Bed3 - receptacle
    Sofa3 - receptacle
    Drawer1 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Sofa4 - receptacle
    Bed2 - receptacle
    GarbageCan1 - receptacle
    KeyChain1 - object
    Box3 - receptacle_object
    Box4 - receptacle_object
  )

  (:init
    (atLocation agent1 Sofa1)
    (objectAtLocation Laptop1 Desk1)
    (objectAtLocation Pillow1 Sofa1)
    (objectAtLocation Pillow2 Bed1)
    (objectAtLocation Book1 Drawer1)
    (objectAtLocation CellPhone1 Bed2)
    (objectAtLocation Watch1 Desk2)
    (objectAtLocation Book2 Bed3)
    (objectAtLocation Laptop2 Sofa2)
    (objectAtLocation CreditCard1 Sofa3)
    (objectAtLocation CD1 Desk3)
    (objectAtLocation Pen1 Desk5)
    (objectAtLocation KeyChain1 Desk1)
    (objectAtLocation Pencil1 Box4)
    (objectAtLocation Box4 Box2)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box3 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation Laptop1 Sofa3)
      (objectAtLocation Pencil1 Sofa3)
      (not (objectAtLocation Laptop1 Box2))
      (not (objectAtLocation Laptop1 Box4))
      (not (objectAtLocation Pencil1 Box2))
      (not (objectAtLocation Pencil1 Box4))
    )
  )
)
