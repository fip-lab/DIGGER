(define (problem put_KeyChain1_to_Sofa2_20)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    Pillow1 - object
    AlarmClock1 - object
    KeyChain1 - object
    Book1 - object
    CreditCard2 - object
    Pen1 - object
    CreditCard1 - object
    Laptop1 - object
    Box1 - receptacle_object
    Box2 - receptacle_object
    CellPhone2 - object
    CellPhone1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Drawer3 - receptacle
    Drawer4 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    Pencil1 - object
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Bed1)
    (objectAtLocation KeyChain1 Drawer1)
    (objectAtLocation Pillow1 Bed1)
    (objectAtLocation Laptop1 Bed2)
    (objectAtLocation Pen1 Desk2)
    (objectAtLocation CreditCard1 Drawer2)
    (objectAtLocation AlarmClock1 Desk3)
    (objectAtLocation CellPhone2 Drawer3)
    (objectAtLocation Book1 Drawer4)
    (objectAtLocation Book2 Sofa2)
    (objectAtLocation CreditCard2 Desk4)
    (objectAtLocation Pencil1 Box3)
    (objectAtLocation Box3 Box1)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box2 Sofa2)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation KeyChain1 Sofa2)
      (objectAtLocation Pencil1 Sofa2)
      (not (objectAtLocation KeyChain1 Box1))
      (not (objectAtLocation KeyChain1 Box3))
      (not (objectAtLocation Pencil1 Box1))
      (not (objectAtLocation Pencil1 Box3))
    )
  )
)
