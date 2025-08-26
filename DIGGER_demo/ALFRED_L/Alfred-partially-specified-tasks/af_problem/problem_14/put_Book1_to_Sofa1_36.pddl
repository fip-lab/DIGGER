(define (problem put_Book1_to_Sofa1_36)
  (:domain put_task)
  (:objects
agent1 - agent    Box1 - receptacle_object
    Pillow1 - object
    CD1 - object
    CreditCard4 - object
    CreditCard3 - object
    Pencil2 - object
    CellPhone1 - object
    Watch1 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    Pillow2 - object
    Laptop1 - object
    CreditCard2 - object
    Pencil1 - object
    Desk5 - receptacle
    Sofa1 - receptacle
    Sofa2 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Box3 - receptacle_object
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    Box2 - receptacle_object
    Desk6 - receptacle
    AlarmClock1 - object
    Box4 - receptacle_object
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Bed1)
    (objectAtLocation Book1 Drawer1)
    (objectAtLocation CellPhone1 Bed1)
    (objectAtLocation Pillow1 Bed2)
    (objectAtLocation Pencil1 Desk1)
    (objectAtLocation Laptop1 Desk2)
    (objectAtLocation Pen1 Desk3)
    (objectAtLocation CreditCard2 Drawer2)
    (objectAtLocation CreditCard3 Sofa1)
    (objectAtLocation CreditCard4 Desk5)
    (objectAtLocation Pillow2 Sofa2)
    (objectAtLocation CD1 Desk6)
    (objectAtLocation AlarmClock1 Box3)
    (objectAtLocation Box3 Box2)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation Book1 Sofa1)
      (objectAtLocation AlarmClock1 Sofa1)
      (not (objectAtLocation Book1 Box2))
      (not (objectAtLocation Book1 Box3))
      (not (objectAtLocation AlarmClock1 Box2))
      (not (objectAtLocation AlarmClock1 Box3))
    )
  )
)
