(define (problem move_CreditCard1_to_Box1_with_three_object_28)
  (:domain put_task)
  (:objects
    agent1 - agent
    KeyChain1 - object
    AlarmClock1 - object
    Book1 - object
    Laptop1 - object
    Book2 - object
    CreditCard2 - object
    Laptop2 - object
    CreditCard1 - object
    Box1 - receptacle
    Pencil1 - object
    CreditCard3 - object
    Pen1 - object
    Pillow1 - object
    Sofa2 - receptacle
    Drawer1 - receptacle
    Box2 - receptacle
    Desk2 - receptacle
    GarbageCan1 - receptacle
    Desk3 - receptacle
    Sofa1 - receptacle
    Desk1 - receptacle
    Desk4 - receptacle
    Box3 - receptacle
    Sofa3 - receptacle
    Desk5 - receptacle
    Laptop3 - object
    Laptop4 - object
    Laptop5 - object
    Laptop6 - object
    Pencil2 - object
  )

  (:init
    (atLocation agent1 Sofa1)
    (objectAtLocation CreditCard1 Desk1)
    (objectAtLocation Pillow1 Sofa1)
    (objectAtLocation CreditCard2 Sofa2)
    (objectAtLocation Pen1 Desk2)
    (objectAtLocation Book1 Desk3)
    (objectAtLocation Pencil1 GarbageCan1)
    (objectAtLocation Book2 Drawer1)
    (objectAtLocation Pencil2 Desk4)
    (objectAtLocation Laptop3 Box1)
    (objectAtLocation Laptop4 Box1)
    (objectAtLocation Laptop1 Box2)
    (objectAtLocation Laptop5 Box1)
    (objectAtLocation Laptop6 Box3)
    (objectAtLocation Laptop2 Box3)
  )

  (:goal
    (and
      (objectAtLocation CreditCard1 Box1)
    )
  )
)
