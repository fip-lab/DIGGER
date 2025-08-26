(define (problem move_Book1_to_Box2_with_three_object_9)
  (:domain put_task)
  (:objects
    agent1 - agent
    KeyChain1 - object
    AlarmClock1 - object
    Book1 - object
    Book2 - object
    CreditCard2 - object
    CD1 - object
    CreditCard1 - object
    Box1 - receptacle
    Pencil1 - object
    CellPhone1 - object
    Pen2 - object
    Pen1 - object
    Book3 - object
    Sofa2 - receptacle
    Drawer1 - receptacle
    Bed1 - receptacle
    Box4 - receptacle
    Box2 - receptacle
    Desk2 - receptacle
    GarbageCan1 - receptacle
    Sofa1 - receptacle
    GarbageCan2 - receptacle
    Desk1 - receptacle
    Box3 - receptacle
    Drawer2 - receptacle
    Laptop1 - object
    Laptop2 - object
    Laptop3 - object
    Laptop4 - object
    Laptop5 - object
    Laptop6 - object
  )

  (:init
    (atLocation agent1 Desk1)
    (objectAtLocation Book1 Drawer1)
    (objectAtLocation KeyChain1 Desk1)
    (objectAtLocation CreditCard1 Desk2)
    (objectAtLocation Pen2 GarbageCan1)
    (objectAtLocation Book2 Bed1)
    (objectAtLocation Pencil1 GarbageCan2)
    (objectAtLocation Book3 Sofa2)
    (objectAtLocation CD1 Drawer2)
    (objectAtLocation Laptop1 Box2)
    (objectAtLocation Laptop3 Box1)
    (objectAtLocation Laptop5 Box2)
    (objectAtLocation Laptop2 Box2)
    (objectAtLocation Laptop4 Box3)
    (objectAtLocation Laptop6 Box1)
  )

  (:goal
    (and
      (objectAtLocation Book1 Box2)
    )
  )
)
