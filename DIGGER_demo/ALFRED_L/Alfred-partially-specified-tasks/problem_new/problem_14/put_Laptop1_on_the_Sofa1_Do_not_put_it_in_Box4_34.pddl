(define (problem put_Laptop1_on_the_Sofa1_Do_not_put_it_in_Box4_34)
  (:domain put_task)
  (:objects
agent1 - agent    Pillow1 - object
    AlarmClock1 - object
    CD1 - object
    KeyChain2 - object
    Laptop2 - object
    Watch1 - object
    KeyChain1 - object
    CreditCard1 - object
    Laptop1 - object
    CreditCard2 - object
    Pencil1 - object
    Sofa1 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    Box1 - receptacle_object
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa2 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Desk1)
    (objectAtLocation Laptop1 Sofa1)
    (objectAtLocation Watch1 Desk1)
    (objectAtLocation Pencil1 GarbageCan1)
    (objectAtLocation CreditCard1 Drawer1)
    (objectAtLocation Pillow1 Bed1)
    (objectAtLocation KeyChain2 Desk2)
    (objectAtLocation CD1 Drawer2)
    (objectAtLocation Laptop2 Bed2)
    (objectAtLocation CreditCard2 Desk3)
    (objectAtLocation KeyChain1 Bed1)
    (objectAtLocation AlarmClock1 Box3)
    (objectAtLocation Box3 Box4)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box4 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation Laptop1 Sofa1)
      (objectAtLocation AlarmClock1 Sofa1)
      (not (objectAtLocation Laptop1 Box4))
      (not (objectAtLocation Laptop1 Box3))
      (not (objectAtLocation AlarmClock1 Box4))
      (not (objectAtLocation AlarmClock1 Box3))
    )
  )
)
