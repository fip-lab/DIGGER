(define (problem put_Book1_on_the_Sofa3_Do_not_put_it_in_Box1_65)
  (:domain put_task)
  (:objects
    agent1 - agent
    AlarmClock1 - object
    CellPhone1 - object
    Laptop1 - object
    Watch1 - object
    Book2 - object
    KeyChain1 - object
    CD1 - object
    Book1 - object
    CreditCard1 - object
    Box1 - receptacle
    Pillow1 - object
    Desk1 - receptacle
    Bed1 - receptacle
    Bed3 - receptacle
    Bed2 - receptacle
    Desk3 - receptacle
    Box2 - receptacle
    Drawer2 - receptacle
    Sofa1 - receptacle
    Drawer1 - receptacle
    Desk2 - receptacle
    Book3 - object
    Book4 - object
    Laptop2 - object
    Laptop3 - object
    Box3 - receptacle
    Box4 - receptacle
    Sofa2 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Desk1)
    (objectAtLocation Book1 Bed1)
    (objectAtLocation CellPhone1 Desk1)
    (objectAtLocation Laptop1 Bed2)
    (objectAtLocation Watch1 Drawer1)
    (objectAtLocation Pillow1 Bed3)
    (objectAtLocation CreditCard1 Desk2)
    (objectAtLocation CD1 Desk3)
    (objectAtLocation Book3 Box1)
    (objectAtLocation Book4 Desk2)
    (objectAtLocation Laptop2 Bed1)
    (objectAtLocation Laptop3 Bed3)
    (objectAtLocation Book2 Box4)
    (objectAtLocation Box1 Sofa3)
    (objectAtLocation Box2 Sofa2)
    (objectAtLocation Box3 Sofa1)
    (objectAtLocation Box4 Sofa3)
  )

  (:goal
    (and
      (objectAtLocation Book1 Sofa3)
      (not (objectAtLocation Book1 Box1))
    )
  )
)
