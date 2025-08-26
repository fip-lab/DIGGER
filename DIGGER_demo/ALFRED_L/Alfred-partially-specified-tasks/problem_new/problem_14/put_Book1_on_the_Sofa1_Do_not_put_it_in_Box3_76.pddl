(define (problem put_Book1_on_the_Sofa1_Do_not_put_it_in_Box3_76)
  (:domain put_task)
  (:objects
agent1 - agent    Laptop3 - object
    Pillow1 - object
    Box2 - receptacle_object
    CD1 - object
    Laptop2 - object
    KeyChain1 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    Laptop1 - object
    Box1 - receptacle_object
    CreditCard2 - object
    CellPhone1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Sofa3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    AlarmClock1 - object
    Pencil1 - object
    Box3 - receptacle_object
    Box4 - receptacle_object
  )

  (:init
    (atLocation agent1 Bed1)
    (objectAtLocation Book1 Desk1)
    (objectAtLocation Pillow1 Bed1)
    (objectAtLocation Laptop1 Bed2)
    (objectAtLocation Laptop2 Desk2)
    (objectAtLocation Pen1 Desk3)
    (objectAtLocation Laptop3 Sofa2)
    (objectAtLocation CreditCard2 Drawer1)
    (objectAtLocation CD1 Drawer2)
    (objectAtLocation KeyChain1 Sofa3)
    (objectAtLocation Pencil1 Sofa2)
    (objectAtLocation AlarmClock1 Box4)
    (objectAtLocation Box4 Box3)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box3 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation Book1 Sofa1)
      (objectAtLocation AlarmClock1 Sofa1)
      (not (objectAtLocation Book1 Box3))
      (not (objectAtLocation Book1 Box4))
      (not (objectAtLocation AlarmClock1 Box3))
      (not (objectAtLocation AlarmClock1 Box4))
    )
  )
)
