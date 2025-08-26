(define (problem put_Laptop1_on_the_Sofa2_Do_not_put_it_in_Box1_62)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    CD1 - object
    AlarmClock1 - object
    KeyChain2 - object
    KeyChain1 - object
    Book1 - object
    Book3 - object
    Pen1 - object
    CreditCard1 - object
    Laptop1 - object
    Box1 - receptacle_object
    CD2 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Box3 - receptacle_object
    Desk2 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    GarbageCan2 - receptacle
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    Pencil1 - object
    Box4 - receptacle_object
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Sofa1)
    (objectAtLocation Laptop1 Bed1)
    (objectAtLocation KeyChain1 Sofa1)
    (objectAtLocation CD2 GarbageCan1)
    (objectAtLocation AlarmClock1 Desk1)
    (objectAtLocation Pen1 GarbageCan2)
    (objectAtLocation KeyChain2 Drawer1)
    (objectAtLocation Book2 Sofa2)
    (objectAtLocation Book3 Drawer2)
    (objectAtLocation Book1 GarbageCan2)
    (objectAtLocation Pencil1 Box3)
    (objectAtLocation Box3 Box1)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box2 Sofa2)
    (objectAtLocation Box4 Sofa3)
  )

  (:goal
    (and
      (objectAtLocation Laptop1 Sofa2)
      (objectAtLocation Pencil1 Sofa2)
      (not (objectAtLocation Laptop1 Box1))
      (not (objectAtLocation Laptop1 Box3))
      (not (objectAtLocation Pencil1 Box1))
      (not (objectAtLocation Pencil1 Box3))
    )
  )
)
