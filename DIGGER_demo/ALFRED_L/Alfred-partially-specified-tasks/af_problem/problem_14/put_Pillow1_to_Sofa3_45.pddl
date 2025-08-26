(define (problem put_Pillow1_to_Sofa3_45)
  (:domain put_task)
  (:objects
agent1 - agent    Pen2 - object
    Pillow1 - object
    AlarmClock1 - object
    KeyChain1 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    CreditCard2 - object
    Pencil1 - object
    CellPhone1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Box4 - receptacle_object
    Drawer3 - receptacle
    Sofa3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Box3 - receptacle_object
    Box1 - receptacle_object
    Box2 - receptacle_object
  )

  (:init
    (atLocation agent1 Drawer1)
    (objectAtLocation Pillow1 Sofa1)
    (objectAtLocation CellPhone1 Drawer1)
    (objectAtLocation KeyChain1 Sofa2)
    (objectAtLocation Pen1 Drawer2)
    (objectAtLocation CreditCard1 Sofa3)
    (objectAtLocation Pencil1 Drawer3)
    (objectAtLocation Book1 Box2)
    (objectAtLocation Box2 Box3)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box3 Sofa3)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation Pillow1 Sofa3)
      (objectAtLocation Book1 Sofa3)
      (not (objectAtLocation Pillow1 Box3))
      (not (objectAtLocation Pillow1 Box2))
      (not (objectAtLocation Book1 Box3))
      (not (objectAtLocation Book1 Box2))
    )
  )
)
