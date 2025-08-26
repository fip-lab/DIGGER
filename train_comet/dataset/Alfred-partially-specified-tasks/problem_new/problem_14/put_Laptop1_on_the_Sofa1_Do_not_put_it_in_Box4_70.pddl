(define (problem put_Laptop1_on_the_Sofa1_Do_not_put_it_in_Box4_70)
  (:domain put_task)
  (:objects
agent1 - agent    Pillow1 - object
    CD1 - object
    AlarmClock1 - object
    Pencil2 - object
    CellPhone1 - object
    KeyChain1 - object
    Book1 - object
    Laptop1 - object
    Box1 - receptacle_object
    CellPhone2 - object
    Pencil1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Bed3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    GarbageCan1 - receptacle
    Box2 - receptacle_object
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Bed2)
    (objectAtLocation Laptop1 Bed1)
    (objectAtLocation CellPhone1 Bed2)
    (objectAtLocation Pencil1 Desk1)
    (objectAtLocation Book1 Sofa2)
    (objectAtLocation CD1 GarbageCan1)
    (objectAtLocation AlarmClock1 Desk2)
    (objectAtLocation Pillow1 Bed3)
    (objectAtLocation CellPhone2 Drawer1)
    (objectAtLocation Pencil2 Drawer2)
    (objectAtLocation KeyChain1 Box1)
    (objectAtLocation Box1 Box4)
    (objectAtLocation Box2 Sofa2)
    (objectAtLocation Box3 Sofa2)
    (objectAtLocation Box4 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation Laptop1 Sofa1)
      (objectAtLocation KeyChain1 Sofa1)
      (not (objectAtLocation Laptop1 Box4))
      (not (objectAtLocation Laptop1 Box1))
      (not (objectAtLocation KeyChain1 Box4))
      (not (objectAtLocation KeyChain1 Box1))
    )
  )
)
