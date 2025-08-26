(define (problem put_Book1_on_the_Sofa2_Do_not_put_it_in_Box1_42)
  (:domain put_task)
  (:objects
agent1 - agent    AlarmClock1 - object
    CD1 - object
    Watch2 - object
    Watch1 - object
    Book1 - object
    KeyChain1 - object
    Pen1 - object
    Laptop1 - object
    CellPhone2 - object
    CellPhone1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Box3 - receptacle_object
    Bed1 - receptacle
    Desk1 - receptacle
    Box1 - receptacle_object
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    Box4 - receptacle_object
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Drawer1)
    (objectAtLocation Book1 Bed1)
    (objectAtLocation CellPhone1 Drawer1)
    (objectAtLocation Laptop1 Sofa1)
    (objectAtLocation Watch2 Drawer2)
    (objectAtLocation CellPhone2 Desk1)
    (objectAtLocation CD1 GarbageCan1)
    (objectAtLocation AlarmClock1 Box1)
    (objectAtLocation KeyChain1 Box2)
    (objectAtLocation Box2 Box1)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box3 Sofa1)
    (objectAtLocation Box4 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation Book1 Sofa2)
      (objectAtLocation KeyChain1 Sofa2)
      (not (objectAtLocation Book1 Box1))
      (not (objectAtLocation Book1 Box2))
      (not (objectAtLocation KeyChain1 Box1))
      (not (objectAtLocation KeyChain1 Box2))
    )
  )
)
