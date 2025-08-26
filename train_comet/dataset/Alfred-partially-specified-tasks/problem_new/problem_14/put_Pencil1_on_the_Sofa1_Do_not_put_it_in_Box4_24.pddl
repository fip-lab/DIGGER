(define (problem put_Pencil1_on_the_Sofa1_Do_not_put_it_in_Box4_24)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    Pillow1 - object
    CD1 - object
    Watch2 - object
    Laptop2 - object
    Watch1 - object
    Book1 - object
    Laptop1 - object
    Pencil1 - object
    CellPhone1 - object
    Drawer3 - receptacle
    Bed3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    GarbageCan1 - receptacle
    AlarmClock1 - object
    Box1 - receptacle_object
    Box2 - receptacle_object
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa1 - receptacle
    Sofa2 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Bed1)
    (objectAtLocation Pencil1 GarbageCan1)
    (objectAtLocation Laptop1 Bed1)
    (objectAtLocation Pillow1 Bed2)
    (objectAtLocation Book1 Drawer1)
    (objectAtLocation CellPhone1 Drawer2)
    (objectAtLocation Book2 Bed3)
    (objectAtLocation CD1 Desk1)
    (objectAtLocation Watch1 Desk2)
    (objectAtLocation Laptop2 Desk3)
    (objectAtLocation Watch2 Drawer3)
    (objectAtLocation AlarmClock1 Box3)
    (objectAtLocation Box3 Box4)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box4 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation Pencil1 Sofa1)
      (objectAtLocation AlarmClock1 Sofa1)
      (not (objectAtLocation Pencil1 Box4))
      (not (objectAtLocation Pencil1 Box3))
      (not (objectAtLocation AlarmClock1 Box4))
      (not (objectAtLocation AlarmClock1 Box3))
    )
  )
)
