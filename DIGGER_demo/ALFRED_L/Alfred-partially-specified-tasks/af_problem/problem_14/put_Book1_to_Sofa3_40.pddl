(define (problem put_Book1_to_Sofa3_40)
  (:domain put_task)
  (:objects
agent1 - agent    Pillow1 - object
    CD1 - object
    AlarmClock1 - object
    CellPhone1 - object
    Watch1 - object
    Book1 - object
    KeyChain1 - object
    Pen1 - object
    CreditCard1 - object
    Laptop1 - object
    CreditCard2 - object
    Pencil1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Drawer3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Box3 - receptacle_object
    Desk3 - receptacle
    Desk1 - receptacle
    Box1 - receptacle_object
    Box2 - receptacle_object
    Box4 - receptacle_object
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Drawer1)
    (objectAtLocation Book1 Sofa1)
    (objectAtLocation CreditCard1 Drawer1)
    (objectAtLocation Pillow1 Sofa2)
    (objectAtLocation Watch1 Desk1)
    (objectAtLocation CreditCard2 Desk2)
    (objectAtLocation KeyChain1 Drawer2)
    (objectAtLocation CellPhone1 Drawer3)
    (objectAtLocation Laptop1 Desk3)
    (objectAtLocation CD1 Desk4)
    (objectAtLocation Pencil1 Box4)
    (objectAtLocation Box4 Box1)
    (objectAtLocation Box1 Sofa3)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box3 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation Book1 Sofa3)
      (objectAtLocation Pencil1 Sofa3)
      (not (objectAtLocation Book1 Box1))
      (not (objectAtLocation Book1 Box4))
      (not (objectAtLocation Pencil1 Box1))
      (not (objectAtLocation Pencil1 Box4))
    )
  )
)
