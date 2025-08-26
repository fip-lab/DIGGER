(define (problem put_Pen1_on_the_Sofa1_Do_not_put_it_in_Box1_59)
  (:domain put_task)
  (:objects
    agent1 - agent
    Pen1 - object
    AlarmClock1 - object
    CellPhone1 - object
    Book2 - object
    KeyChain1 - object
    CreditCard2 - object
    CD1 - object
    Book1 - object
    CreditCard1 - object
    Pen3 - object
    Box1 - receptacle
    Pen2 - object
    Pillow1 - object
    Desk1 - receptacle
    Bed1 - receptacle
    Desk3 - receptacle
    Bed2 - receptacle
    Box2 - receptacle
    Bed3 - receptacle
    Box3 - receptacle
    Desk4 - receptacle
    Sofa1 - receptacle
    Drawer1 - receptacle
    Desk2 - receptacle
    Desk5 - receptacle
    Laptop1 - object
    Laptop2 - object
    Laptop3 - object
    Laptop4 - object
    Book3 - object
    Box4 - receptacle
    Sofa2 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Desk1)
    (objectAtLocation Pen1 Drawer1)
    (objectAtLocation Book1 Desk1)
    (objectAtLocation CreditCard1 Desk2)
    (objectAtLocation AlarmClock1 Desk3)
    (objectAtLocation Pen2 Desk4)
    (objectAtLocation KeyChain1 Desk5)
    (objectAtLocation Pillow1 Bed1)
    (objectAtLocation Book2 Bed2)
    (objectAtLocation CellPhone1 Bed3)
    (objectAtLocation Laptop2 Bed2)
    (objectAtLocation Laptop3 Bed3)
    (objectAtLocation Laptop4 Bed1)
    (objectAtLocation Book3 Bed2)
    (objectAtLocation Laptop1 Box1)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box3 Sofa1)
    (objectAtLocation Box4 Sofa3)
  )

  (:goal
    (and
      (objectAtLocation Pen1 Sofa1)
      (not (objectAtLocation Pen1 Box1))
    )
  )
)
