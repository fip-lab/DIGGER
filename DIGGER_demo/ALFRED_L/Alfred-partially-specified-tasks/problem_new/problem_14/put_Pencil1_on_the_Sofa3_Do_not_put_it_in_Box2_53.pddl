(define (problem put_Pencil1_on_the_Sofa3_Do_not_put_it_in_Box2_53)
  (:domain put_task)
  (:objects
agent1 - agent    CellPhone3 - object
    AlarmClock1 - object
    Laptop1 - object
    Watch1 - object
    KeyChain1 - object
    Book1 - object
    Pen1 - object
    CellPhone2 - object
    Pencil1 - object
    CellPhone1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Drawer1 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    Box1 - receptacle_object
    GarbageCan1 - receptacle
    Box2 - receptacle_object
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Bed1)
    (objectAtLocation Pencil1 GarbageCan1)
    (objectAtLocation CellPhone1 Bed1)
    (objectAtLocation AlarmClock1 Desk1)
    (objectAtLocation CellPhone2 Drawer1)
    (objectAtLocation Pen1 Desk2)
    (objectAtLocation CellPhone3 Sofa1)
    (objectAtLocation Laptop1 Bed2)
    (objectAtLocation Book1 Desk3)
    (objectAtLocation KeyChain1 Box4)
    (objectAtLocation Box4 Box2)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box3 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation Pencil1 Sofa3)
      (objectAtLocation KeyChain1 Sofa3)
      (not (objectAtLocation Pencil1 Box2))
      (not (objectAtLocation Pencil1 Box4))
      (not (objectAtLocation KeyChain1 Box2))
      (not (objectAtLocation KeyChain1 Box4))
    )
  )
)
