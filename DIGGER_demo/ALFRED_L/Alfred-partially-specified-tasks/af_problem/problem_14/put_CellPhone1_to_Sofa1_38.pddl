(define (problem put_CellPhone1_to_Sofa1_38)
  (:domain put_task)
  (:objects
agent1 - agent    Laptop3 - object
    AlarmClock1 - object
    Laptop2 - object
    CellPhone1 - object
    CD2 - object
    Pen1 - object
    CreditCard1 - object
    Laptop1 - object
    Box1 - receptacle_object
    CD3 - object
    Box2 - receptacle_object
    CellPhone2 - object
    CD1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Sofa3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    GarbageCan1 - receptacle
    Book1 - object
    Box3 - receptacle_object
    Box4 - receptacle_object
  )

  (:init
    (atLocation agent1 GarbageCan1)
    (objectAtLocation CellPhone1 Bed1)
    (objectAtLocation CD1 GarbageCan1)
    (objectAtLocation Laptop1 Desk1)
    (objectAtLocation CreditCard1 Drawer1)
    (objectAtLocation Pen1 Drawer2)
    (objectAtLocation CellPhone2 Sofa1)
    (objectAtLocation Laptop2 Sofa2)
    (objectAtLocation Laptop3 Bed2)
    (objectAtLocation CD3 Desk3)
    (objectAtLocation AlarmClock1 Sofa2)
    (objectAtLocation Book1 Box2)
    (objectAtLocation Box2 Box1)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box3 Sofa1)
    (objectAtLocation Box4 Sofa3)
  )

  (:goal
    (and
      (objectAtLocation CellPhone1 Sofa1)
      (objectAtLocation Book1 Sofa1)
      (not (objectAtLocation CellPhone1 Box1))
      (not (objectAtLocation CellPhone1 Box2))
      (not (objectAtLocation Book1 Box1))
      (not (objectAtLocation Book1 Box2))
    )
  )
)
