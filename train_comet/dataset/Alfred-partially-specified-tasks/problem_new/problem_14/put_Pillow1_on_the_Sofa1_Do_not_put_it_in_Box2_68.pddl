(define (problem put_Pillow1_on_the_Sofa1_Do_not_put_it_in_Box2_68)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    Pillow1 - object
    AlarmClock1 - object
    KeyChain2 - object
    CellPhone1 - object
    KeyChain1 - object
    Book1 - object
    CreditCard1 - object
    Laptop1 - object
    CD1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Drawer1 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    Box1 - receptacle_object
    GarbageCan1 - receptacle
    Box2 - receptacle_object
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Desk1)
    (objectAtLocation Pillow1 Bed1)
    (objectAtLocation Book2 Desk1)
    (objectAtLocation CreditCard1 Sofa1)
    (objectAtLocation CD1 GarbageCan1)
    (objectAtLocation CellPhone1 Desk2)
    (objectAtLocation KeyChain2 Drawer1)
    (objectAtLocation AlarmClock1 Desk3)
    (objectAtLocation Laptop1 Sofa2)
    (objectAtLocation Book1 Box4)
    (objectAtLocation Box4 Box2)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box3 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation Pillow1 Sofa1)
      (objectAtLocation Book1 Sofa1)
      (not (objectAtLocation Pillow1 Box2))
      (not (objectAtLocation Pillow1 Box4))
      (not (objectAtLocation Book1 Box2))
      (not (objectAtLocation Book1 Box4))
    )
  )
)
