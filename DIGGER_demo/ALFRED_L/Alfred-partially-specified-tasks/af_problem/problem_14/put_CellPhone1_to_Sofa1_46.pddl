(define (problem put_CellPhone1_to_Sofa1_46)
  (:domain put_task)
  (:objects
agent1 - agent    Pillow1 - object
    AlarmClock1 - object
    Pencil3 - object
    CellPhone1 - object
    KeyChain1 - object
    Book1 - object
    CreditCard2 - object
    Watch1 - object
    Pen1 - object
    CreditCard1 - object
    Pencil2 - object
    Box1 - receptacle_object
    Pencil1 - object
    CD1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Drawer3 - receptacle
    Sofa3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Box3 - receptacle_object
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    Box4 - receptacle_object
  )

  (:init
    (atLocation agent1 Drawer2)
    (objectAtLocation CellPhone1 Drawer1)
    (objectAtLocation CD1 Drawer2)
    (objectAtLocation Pencil1 Drawer3)
    (objectAtLocation Book1 Sofa1)
    (objectAtLocation Pencil2 GarbageCan1)
    (objectAtLocation Pillow1 Bed1)
    (objectAtLocation Pencil3 Desk2)
    (objectAtLocation CreditCard2 Sofa3)
    (objectAtLocation Watch1 Desk3)
    (objectAtLocation KeyChain1 Box3)
    (objectAtLocation Box3 Box1)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation CellPhone1 Sofa1)
      (objectAtLocation KeyChain1 Sofa1)
      (not (objectAtLocation CellPhone1 Box1))
      (not (objectAtLocation CellPhone1 Box3))
      (not (objectAtLocation KeyChain1 Box1))
      (not (objectAtLocation KeyChain1 Box3))
    )
  )
)
