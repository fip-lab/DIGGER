(define (problem put_Book1_to_Sofa2_6)
  (:domain put_task)
  (:objects
agent1 - agent    CellPhone3 - object
    AlarmClock1 - object
    CD1 - object
    Laptop2 - object
    CellPhone1 - object
    Watch1 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    Laptop1 - object
    CellPhone2 - object
    Pen2 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Drawer3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Box1 - receptacle_object
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    Pencil1 - object
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 GarbageCan1)
    (objectAtLocation Book1 Drawer1)
    (objectAtLocation Pen1 GarbageCan1)
    (objectAtLocation CreditCard1 Drawer2)
    (objectAtLocation Laptop1 Bed1)
    (objectAtLocation Laptop2 Sofa1)
    (objectAtLocation Watch1 Desk1)
    (objectAtLocation Pen2 Desk2)
    (objectAtLocation CellPhone1 Desk3)
    (objectAtLocation CD1 Drawer3)
    (objectAtLocation CellPhone2 Sofa2)
    (objectAtLocation Pencil1 Bed1)
    (objectAtLocation AlarmClock1 Box4)
    (objectAtLocation Box4 Box1)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box3 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation Book1 Sofa2)
      (objectAtLocation AlarmClock1 Sofa2)
      (not (objectAtLocation Book1 Box1))
      (not (objectAtLocation Book1 Box4))
      (not (objectAtLocation AlarmClock1 Box1))
      (not (objectAtLocation AlarmClock1 Box4))
    )
  )
)
