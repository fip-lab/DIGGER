(define (problem put_CellPhone1_to_Sofa2_21)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    AlarmClock1 - object
    Pencil2 - object
    Watch1 - object
    Book1 - object
    Pen1 - object
    CellPhone2 - object
    Box1 - receptacle_object
    Pencil1 - object
    CellPhone1 - object
    Drawer1 - receptacle
    Box3 - receptacle_object
    Desk2 - receptacle
    Desk4 - receptacle
    Desk3 - receptacle
    Desk1 - receptacle
    GarbageCan2 - receptacle
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    KeyChain1 - object
    Box4 - receptacle_object
    Sofa1 - receptacle
    Sofa2 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Desk2)
    (objectAtLocation CellPhone1 Drawer1)
    (objectAtLocation CellPhone2 Desk2)
    (objectAtLocation Pen1 GarbageCan1)
    (objectAtLocation Pencil2 GarbageCan2)
    (objectAtLocation Book2 Desk3)
    (objectAtLocation Watch1 Desk4)
    (objectAtLocation KeyChain1 GarbageCan2)
    (objectAtLocation Pencil1 Box4)
    (objectAtLocation Box4 Box3)
    (objectAtLocation Box1 Sofa3)
    (objectAtLocation Box2 Sofa2)
    (objectAtLocation Box3 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation CellPhone1 Sofa2)
      (objectAtLocation Pencil1 Sofa2)
      (not (objectAtLocation CellPhone1 Box3))
      (not (objectAtLocation CellPhone1 Box4))
      (not (objectAtLocation Pencil1 Box3))
      (not (objectAtLocation Pencil1 Box4))
    )
  )
)
