(define (problem put_CD1_to_Box2_7)
  (:domain put_task)
  (:objects
    agent1 - agent
    CellPhone2 - object
    Book1 - object
    Laptop1 - object
    Book2 - object
    Watch1 - object
    Pen1 - object
    CreditCard1 - object
    Box1 - receptacle
    Pencil1 - object
    CellPhone1 - object
    Pen3 - object
    Pen2 - object
    CD1 - object
    Pillow1 - object
    Sofa2 - receptacle
    Drawer1 - receptacle
    Bed1 - receptacle
    Box2 - receptacle
    GarbageCan1 - receptacle
    Desk2 - receptacle
    Box3 - receptacle
    Sofa1 - receptacle
    GarbageCan2 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    Sofa3 - receptacle
    Drawer2 - receptacle
    Book3 - object
    Book4 - object
    Book5 - object
    Book6 - object
    Pencil2 - object
  )

  (:init
    (atLocation agent1 Desk1)
    (objectAtLocation CD1 GarbageCan1)
    (objectAtLocation Pen1 Desk1)
    (objectAtLocation Pillow1 Bed1)
    (objectAtLocation Watch1 Drawer1)
    (objectAtLocation Pen2 Drawer2)
    (objectAtLocation Laptop1 Sofa2)
    (objectAtLocation Pencil1 GarbageCan2)
    (objectAtLocation CellPhone2 Desk2)
    (objectAtLocation Pencil2 Sofa1)
    (objectAtLocation Book4 Box1)
    (objectAtLocation Book2 Box1)
    (objectAtLocation Book5 Box2)
    (objectAtLocation Book3 Box3)
    (objectAtLocation Book6 Box2)
    (objectAtLocation Book1 Box2)
  )

  (:goal
    (and
      (objectAtLocation CD1 Box2)
    )
  )
)
