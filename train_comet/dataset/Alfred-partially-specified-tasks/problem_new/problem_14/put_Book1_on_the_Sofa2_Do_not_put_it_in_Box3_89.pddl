(define (problem put_Book1_on_the_Sofa2_Do_not_put_it_in_Box3_89)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    Pillow1 - object
    CD1 - object
    CreditCard3 - object
    CellPhone1 - object
    KeyChain1 - object
    Book1 - object
    CD2 - object
    Pen1 - object
    CreditCard1 - object
    Book3 - object
    CD3 - object
    CreditCard2 - object
    Pen2 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Desk5 - receptacle
    Box4 - receptacle_object
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Box3 - receptacle_object
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Box1 - receptacle_object
    Box2 - receptacle_object
    Pencil1 - object
    AlarmClock1 - object
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Desk1)
    (objectAtLocation Book1 Sofa1)
    (objectAtLocation KeyChain1 Desk1)
    (objectAtLocation Book2 Desk2)
    (objectAtLocation Book3 Bed1)
    (objectAtLocation Pen2 Desk3)
    (objectAtLocation CD2 Drawer1)
    (objectAtLocation Pillow1 Sofa2)
    (objectAtLocation CD3 Desk4)
    (objectAtLocation CreditCard1 Desk5)
    (objectAtLocation CreditCard3 Drawer2)
    (objectAtLocation AlarmClock1 Drawer1)
    (objectAtLocation Pencil1 Box2)
    (objectAtLocation Box2 Box3)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box3 Sofa2)
    (objectAtLocation Box4 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation Book1 Sofa2)
      (objectAtLocation Pencil1 Sofa2)
      (not (objectAtLocation Book1 Box3))
      (not (objectAtLocation Book1 Box2))
      (not (objectAtLocation Pencil1 Box3))
      (not (objectAtLocation Pencil1 Box2))
    )
  )
)
