(define (problem put_Watch1_on_the_Sofa3_Do_not_put_it_in_Box1_82)
  (:domain put_task)
  (:objects
    agent1 - agent
    Pen1 - object
    AlarmClock1 - object
    Box2 - receptacle
    CellPhone1 - object
    Watch1 - object
    Pencil1 - object
    CreditCard2 - object
    CD1 - object
    Book1 - object
    CreditCard1 - object
    CellPhone2 - object
    Pencil2 - object
    CD2 - object
    Box1 - receptacle
    Watch2 - object
    Desk1 - receptacle
    Bed1 - receptacle
    Desk3 - receptacle
    Drawer2 - receptacle
    Drawer3 - receptacle
    GarbageCan1 - receptacle
    Drawer5 - receptacle
    Desk4 - receptacle
    Drawer4 - receptacle
    Sofa1 - receptacle
    Drawer1 - receptacle
    Desk2 - receptacle
    Sofa2 - receptacle
    Pencil3 - object
    Pencil4 - object
    Book2 - object
    Book3 - object
    Box3 - receptacle
    Box4 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Drawer2)
    (objectAtLocation Watch1 Drawer1)
    (objectAtLocation Pen1 Drawer2)
    (objectAtLocation CellPhone2 Bed1)
    (objectAtLocation Watch2 Desk1)
    (objectAtLocation CreditCard1 Sofa2)
    (objectAtLocation Pencil1 Desk2)
    (objectAtLocation Book1 Drawer3)
    (objectAtLocation CD1 Drawer4)
    (objectAtLocation Pencil2 Drawer5)
    (objectAtLocation CreditCard2 Desk3)
    (objectAtLocation CD2 GarbageCan1)
    (objectAtLocation Pencil4 Desk3)
    (objectAtLocation Book2 GarbageCan1)
    (objectAtLocation Book3 Desk2)
    (objectAtLocation Pencil3 Box4)
    (objectAtLocation Box1 Sofa3)
    (objectAtLocation Box2 Sofa2)
    (objectAtLocation Box3 Sofa1)
    (objectAtLocation Box4 Sofa3)
  )

  (:goal
    (and
      (objectAtLocation Watch1 Sofa3)
      (not (objectAtLocation Watch1 Box1))
    )
  )
)
