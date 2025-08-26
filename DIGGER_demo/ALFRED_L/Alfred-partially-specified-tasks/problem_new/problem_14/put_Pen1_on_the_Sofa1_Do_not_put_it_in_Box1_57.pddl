(define (problem put_Pen1_on_the_Sofa1_Do_not_put_it_in_Box1_57)
  (:domain put_task)
  (:objects
agent1 - agent    Pen2 - object
    AlarmClock1 - object
    CD1 - object
    Pencil2 - object
    CellPhone1 - object
    Watch1 - object
    Book1 - object
    KeyChain1 - object
    Pen1 - object
    Laptop1 - object
    Box1 - receptacle_object
    Pencil1 - object
    Sofa1 - receptacle
    Drawer3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Desk1 - receptacle
    Drawer4 - receptacle
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa2 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Desk2)
    (objectAtLocation Pen1 Drawer1)
    (objectAtLocation AlarmClock1 Desk2)
    (objectAtLocation CD1 Drawer3)
    (objectAtLocation Laptop1 Sofa1)
    (objectAtLocation Pen2 GarbageCan1)
    (objectAtLocation KeyChain1 Drawer4)
    (objectAtLocation Pencil2 Desk3)
    (objectAtLocation CellPhone1 Desk4)
    (objectAtLocation Pencil1 Box4)
    (objectAtLocation Box4 Box1)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box2 Sofa2)
    (objectAtLocation Box3 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation Pen1 Sofa1)
      (objectAtLocation Pencil1 Sofa1)
      (not (objectAtLocation Pen1 Box1))
      (not (objectAtLocation Pen1 Box4))
      (not (objectAtLocation Pencil1 Box1))
      (not (objectAtLocation Pencil1 Box4))
    )
  )
)
