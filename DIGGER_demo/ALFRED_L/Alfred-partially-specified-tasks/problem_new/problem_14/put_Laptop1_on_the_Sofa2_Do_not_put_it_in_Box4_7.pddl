(define (problem put_Laptop1_on_the_Sofa2_Do_not_put_it_in_Box4_7)
  (:domain put_task)
  (:objects
agent1 - agent    Box1 - receptacle_object
    AlarmClock1 - object
    AlarmClock2 - object
    KeyChain2 - object
    KeyChain1 - object
    Book1 - object
    CreditCard1 - object
    Laptop1 - object
    CreditCard2 - object
    Pencil1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Sofa3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Sofa4 - receptacle
    Desk1 - receptacle
    GarbageCan1 - receptacle
    Box2 - receptacle_object
    Box3 - receptacle_object
    Box4 - receptacle_object
  )

  (:init
    (atLocation agent1 Sofa1)
    (objectAtLocation Laptop1 Desk1)
    (objectAtLocation KeyChain1 Sofa1)
    (objectAtLocation CreditCard1 Drawer1)
    (objectAtLocation Book1 Sofa2)
    (objectAtLocation AlarmClock1 Desk2)
    (objectAtLocation CreditCard2 Sofa3)
    (objectAtLocation KeyChain2 Drawer2)
    (objectAtLocation Pencil1 Box3)
    (objectAtLocation Box3 Box4)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation Laptop1 Sofa2)
      (objectAtLocation Pencil1 Sofa2)
      (not (objectAtLocation Laptop1 Box4))
      (not (objectAtLocation Laptop1 Box3))
      (not (objectAtLocation Pencil1 Box4))
      (not (objectAtLocation Pencil1 Box3))
    )
  )
)
