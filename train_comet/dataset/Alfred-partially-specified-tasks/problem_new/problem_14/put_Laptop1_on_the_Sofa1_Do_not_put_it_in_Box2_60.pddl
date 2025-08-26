(define (problem put_Laptop1_on_the_Sofa1_Do_not_put_it_in_Box2_60)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    Box1 - receptacle_object
    Pen2 - object
    CD1 - object
    CreditCard3 - object
    Laptop2 - object
    Watch1 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    Laptop1 - object
    CreditCard2 - object
    Pencil1 - object
    CellPhone1 - object
    Desk5 - receptacle
    Drawer3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Box3 - receptacle_object
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    KeyChain1 - object
    Box4 - receptacle_object
    Sofa1 - receptacle
    Sofa2 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Drawer1)
    (objectAtLocation Laptop1 Bed1)
    (objectAtLocation CD1 Drawer1)
    (objectAtLocation Pencil1 Desk1)
    (objectAtLocation CellPhone1 Desk2)
    (objectAtLocation Pen1 Drawer2)
    (objectAtLocation CreditCard2 Desk3)
    (objectAtLocation Laptop2 Desk5)
    (objectAtLocation Pen2 GarbageCan1)
    (objectAtLocation CreditCard3 Drawer3)
    (objectAtLocation KeyChain1 Desk1)
    (objectAtLocation Book1 Box3)
    (objectAtLocation Box3 Box2)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box4 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation Laptop1 Sofa1)
      (objectAtLocation Book1 Sofa1)
      (not (objectAtLocation Laptop1 Box2))
      (not (objectAtLocation Laptop1 Box3))
      (not (objectAtLocation Book1 Box2))
      (not (objectAtLocation Book1 Box3))
    )
  )
)
