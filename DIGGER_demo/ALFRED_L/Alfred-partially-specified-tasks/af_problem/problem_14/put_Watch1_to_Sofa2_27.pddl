(define (problem put_Watch1_to_Sofa2_27)
  (:domain put_task)
  (:objects
agent1 - agent    Box1 - receptacle_object
    AlarmClock2 - object
    AlarmClock1 - object
    CD1 - object
    Watch2 - object
    CellPhone1 - object
    Watch1 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    CreditCard2 - object
    Box2 - receptacle_object
    Pencil1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Box4 - receptacle_object
    Box5 - receptacle_object
    Drawer1 - receptacle
    Drawer2 - receptacle
    Box3 - receptacle_object
    Desk2 - receptacle
    Desk4 - receptacle
    Desk3 - receptacle
    Desk1 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Desk2)
    (objectAtLocation Watch1 Desk1)
    (objectAtLocation AlarmClock2 Desk2)
    (objectAtLocation CreditCard2 Sofa1)
    (objectAtLocation Book1 Drawer2)
    (objectAtLocation CellPhone1 Desk4)
    (objectAtLocation Pencil1 Box3)
    (objectAtLocation Box3 Box4)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation Watch1 Sofa2)
      (objectAtLocation Pencil1 Sofa2)
      (not (objectAtLocation Watch1 Box4))
      (not (objectAtLocation Watch1 Box3))
      (not (objectAtLocation Pencil1 Box4))
      (not (objectAtLocation Pencil1 Box3))
    )
  )
)
