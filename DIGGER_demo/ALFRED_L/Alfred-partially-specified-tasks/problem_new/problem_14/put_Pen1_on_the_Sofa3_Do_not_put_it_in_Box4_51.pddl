(define (problem put_Pen1_on_the_Sofa3_Do_not_put_it_in_Box4_51)
  (:domain put_task)
  (:objects
agent1 - agent    Pen2 - object
    Pillow1 - object
    AlarmClock1 - object
    KeyChain3 - object
    KeyChain2 - object
    CellPhone1 - object
    KeyChain1 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    Pillow2 - object
    Box1 - receptacle_object
    CD1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Drawer3 - receptacle
    Sofa3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Box3 - receptacle_object
    Desk2 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    Pencil1 - object
    Box4 - receptacle_object
  )

  (:init
    (atLocation agent1 Drawer2)
    (objectAtLocation Pen1 Drawer1)
    (objectAtLocation KeyChain1 Drawer2)
    (objectAtLocation Pillow1 Bed1)
    (objectAtLocation CD1 Desk2)
    (objectAtLocation Pen2 GarbageCan1)
    (objectAtLocation CreditCard1 Drawer3)
    (objectAtLocation Pillow2 Sofa2)
    (objectAtLocation KeyChain2 Sofa3)
    (objectAtLocation Pencil1 Box3)
    (objectAtLocation Book1 Box1)
    (objectAtLocation Box1 Box4)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box3 Sofa3)
    (objectAtLocation Box4 Sofa3)
  )

  (:goal
    (and
      (objectAtLocation Pen1 Sofa3)
      (objectAtLocation Book1 Sofa3)
      (not (objectAtLocation Pen1 Box4))
      (not (objectAtLocation Pen1 Box1))
      (not (objectAtLocation Book1 Box4))
      (not (objectAtLocation Book1 Box1))
    )
  )
)
