(define (problem put_Pen1_to_Box2_68)
  (:domain put_task)
  (:objects
    agent1 - agent
    Book1 - object
    Book2 - object
    CD1 - object
    CreditCard1 - object
    Box1 - receptacle
    Pencil1 - object
    CellPhone1 - object
    Pen2 - object
    Pen1 - object
    Pillow1 - object
    Drawer1 - receptacle
    Bed1 - receptacle
    Desk2 - receptacle
    GarbageCan1 - receptacle
    Sofa1 - receptacle
    GarbageCan2 - receptacle
    Desk3 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    Book3 - object
    Book4 - object
    Book5 - object
    Book6 - object
    Pencil2 - object
    Box2 - receptacle
    Box3 - receptacle
    Sofa2 - receptacle
  )

  (:init
    (atLocation agent1 Sofa1)
    (objectAtLocation Pen1 Drawer1)
    (objectAtLocation CreditCard1 Sofa1)
    (objectAtLocation CellPhone1 Desk2)
    (objectAtLocation Pillow1 Bed1)
    (objectAtLocation Pencil1 GarbageCan1)
    (objectAtLocation Pen2 GarbageCan2)
    (objectAtLocation Pencil2 GarbageCan1)
    (objectAtLocation Book3 Box3)
    (objectAtLocation Book4 Box3)
    (objectAtLocation Book1 Box2)
    (objectAtLocation Book5 Box2)
    (objectAtLocation Book2 Box1)
    (objectAtLocation Book6 Box2)
  )

  (:goal
    (and
      (objectAtLocation Pen1 Box2)
    )
  )
)
