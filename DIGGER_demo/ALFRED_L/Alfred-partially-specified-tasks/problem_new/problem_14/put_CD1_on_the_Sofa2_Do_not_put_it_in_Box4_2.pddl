(define (problem put_CD1_on_the_Sofa2_Do_not_put_it_in_Box4_2)
  (:domain put_task)
  (:objects
agent1 - agent    Pillow1 - object
    CD1 - object
    KeyChain2 - object
    KeyChain1 - object
    Pen1 - object
    CreditCard1 - object
    Pillow2 - object
    Laptop1 - object
    Box1 - receptacle_object
    CreditCard2 - object
    CellPhone1 - object
    Sofa1 - receptacle
    Drawer3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Drawer4 - receptacle
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    Pencil1 - object
    AlarmClock1 - object
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa2 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Drawer2)
    (objectAtLocation CD1 Drawer1)
    (objectAtLocation CellPhone1 Drawer2)
    (objectAtLocation KeyChain1 Drawer3)
    (objectAtLocation Laptop1 Desk1)
    (objectAtLocation CreditCard1 Drawer4)
    (objectAtLocation Pen1 GarbageCan1)
    (objectAtLocation Pillow1 Sofa1)
    (objectAtLocation Pillow2 Bed1)
    (objectAtLocation AlarmClock1 Box2)
    (objectAtLocation Pencil1 Box1)
    (objectAtLocation Box1 Box4)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box3 Sofa1)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation CD1 Sofa2)
      (objectAtLocation Pencil1 Sofa2)
      (not (objectAtLocation CD1 Box4))
      (not (objectAtLocation CD1 Box1))
      (not (objectAtLocation Pencil1 Box4))
      (not (objectAtLocation Pencil1 Box1))
    )
  )
)
