(define (problem put_Book1_on_the_Sofa2_Do_not_put_it_in_Box3_36)
  (:domain put_task)
  (:objects
    agent1 - agent
    AlarmClock1 - object
    Laptop1 - object
    Book2 - object
    Watch1 - object
    Pencil1 - object
    CreditCard2 - object
    Book1 - object
    CreditCard1 - object
    Book3 - object
    CreditCard3 - object
    Pillow1 - object
    Desk1 - receptacle
    Bed1 - receptacle
    Box2 - receptacle
    Bed2 - receptacle
    Desk2 - receptacle
    Drawer2 - receptacle
    Box3 - receptacle
    Box1 - receptacle
    Sofa1 - receptacle
    Drawer1 - receptacle
    Box4 - receptacle
    KeyChain1 - object
    KeyChain2 - object
    KeyChain3 - object
    KeyChain4 - object
    Sofa2 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Desk1)
    (objectAtLocation Book1 Drawer1)
    (objectAtLocation AlarmClock1 Desk1)
    (objectAtLocation Book2 Bed1)
    (objectAtLocation CreditCard1 Drawer2)
    (objectAtLocation Pillow1 Sofa1)
    (objectAtLocation Laptop1 Bed2)
    (objectAtLocation CreditCard3 Desk2)
    (objectAtLocation KeyChain1 Sofa1)
    (objectAtLocation KeyChain2 Bed1)
    (objectAtLocation KeyChain4 Drawer2)
    (objectAtLocation Book3 Desk2)
    (objectAtLocation KeyChain3 Box4)
    (objectAtLocation Box1 Sofa3)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box3 Sofa2)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation Book1 Sofa2)
      (not (objectAtLocation Book1 Box3))
    )
  )
)
