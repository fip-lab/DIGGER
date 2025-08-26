(define (problem put_Pencil1_on_the_Sofa3_Do_not_put_it_in_Box4_10)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    Pen2 - object
    Pillow1 - object
    Pen3 - object
    CD1 - object
    AlarmClock1 - object
    CellPhone1 - object
    Watch1 - object
    Book1 - object
    KeyChain1 - object
    CD2 - object
    Pen1 - object
    Box1 - receptacle_object
    Pencil1 - object
    Desk5 - receptacle
    Sofa1 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    GarbageCan2 - receptacle
    Desk6 - receptacle
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa2 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Bed1)
    (objectAtLocation Pencil1 Drawer1)
    (objectAtLocation Pillow1 Bed1)
    (objectAtLocation Watch1 Desk1)
    (objectAtLocation Pen1 GarbageCan1)
    (objectAtLocation CD1 GarbageCan2)
    (objectAtLocation Book1 Desk3)
    (objectAtLocation Pen2 Drawer2)
    (objectAtLocation CD2 Desk4)
    (objectAtLocation CellPhone1 Sofa1)
    (objectAtLocation AlarmClock1 Desk5)
    (objectAtLocation KeyChain1 Box2)
    (objectAtLocation Box2 Box4)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box3 Sofa1)
    (objectAtLocation Box4 Sofa3)
  )

  (:goal
    (and
      (objectAtLocation Pencil1 Sofa3)
      (objectAtLocation KeyChain1 Sofa3)
      (not (objectAtLocation Pencil1 Box4))
      (not (objectAtLocation Pencil1 Box2))
      (not (objectAtLocation KeyChain1 Box4))
      (not (objectAtLocation KeyChain1 Box2))
    )
  )
)
