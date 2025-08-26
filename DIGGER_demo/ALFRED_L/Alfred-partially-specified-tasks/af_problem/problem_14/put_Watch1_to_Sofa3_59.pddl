(define (problem put_Watch1_to_Sofa3_59)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    Box1 - receptacle_object
    Pillow1 - object
    Watch1 - object
    KeyChain1 - object
    Book1 - object
    Book3 - object
    Pen1 - object
    CreditCard1 - object
    Laptop1 - object
    CellPhone2 - object
    Pencil1 - object
    CellPhone1 - object
    Desk5 - receptacle
    Sofa1 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Box3 - receptacle_object
    Desk3 - receptacle
    Desk1 - receptacle
    Desk6 - receptacle
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    Box4 - receptacle_object
    Sofa2 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 GarbageCan1)
    (objectAtLocation Watch1 Desk1)
    (objectAtLocation Pen1 GarbageCan1)
    (objectAtLocation Laptop1 Desk2)
    (objectAtLocation KeyChain1 Desk3)
    (objectAtLocation Book1 Drawer1)
    (objectAtLocation CellPhone1 Desk4)
    (objectAtLocation Book2 Desk5)
    (objectAtLocation Pillow1 Sofa1)
    (objectAtLocation Pencil1 Box4)
    (objectAtLocation Box4 Box2)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box3 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation Watch1 Sofa3)
      (objectAtLocation Pencil1 Sofa3)
      (not (objectAtLocation Watch1 Box2))
      (not (objectAtLocation Watch1 Box4))
      (not (objectAtLocation Pencil1 Box2))
      (not (objectAtLocation Pencil1 Box4))
    )
  )
)
