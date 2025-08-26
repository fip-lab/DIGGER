(define (problem put_Pen1_on_the_Sofa1_Do_not_put_it_in_Box2_43)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    Box1 - receptacle_object
    Pen2 - object
    CD1 - object
    KeyChain1 - object
    Book1 - object
    Pen1 - object
    Book3 - object
    Pencil1 - object
    CellPhone1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Sofa3 - receptacle
    Drawer1 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    GarbageCan1 - receptacle
    Box2 - receptacle_object
    Box3 - receptacle_object
    Box4 - receptacle_object
  )

  (:init
    (atLocation agent1 Sofa1)
    (objectAtLocation Pen1 Desk1)
    (objectAtLocation CellPhone1 Sofa1)
    (objectAtLocation Pen2 GarbageCan1)
    (objectAtLocation Book2 Sofa2)
    (objectAtLocation Book3 Desk2)
    (objectAtLocation Pencil1 Desk3)
    (objectAtLocation KeyChain1 Drawer1)
    (objectAtLocation Book1 Box1)
    (objectAtLocation Box1 Box2)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box3 Sofa3)
    (objectAtLocation Box4 Sofa3)
  )

  (:goal
    (and
      (objectAtLocation Pen1 Sofa1)
      (objectAtLocation Book1 Sofa1)
      (not (objectAtLocation Pen1 Box2))
      (not (objectAtLocation Pen1 Box1))
      (not (objectAtLocation Book1 Box2))
      (not (objectAtLocation Book1 Box1))
    )
  )
)
