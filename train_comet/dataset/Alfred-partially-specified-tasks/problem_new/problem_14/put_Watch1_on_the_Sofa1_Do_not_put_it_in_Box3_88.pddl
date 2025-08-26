(define (problem put_Watch1_on_the_Sofa1_Do_not_put_it_in_Box3_88)
  (:domain put_task)
  (:objects
agent1 - agent    Pillow1 - object
    CD1 - object
    Laptop2 - object
    Watch1 - object
    Book1 - object
    CD2 - object
    Pen1 - object
    CreditCard1 - object
    Laptop1 - object
    Pencil1 - object
    CellPhone1 - object
    Sofa1 - receptacle
    Drawer3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Box1 - receptacle_object
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    KeyChain1 - object
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa2 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Desk1)
    (objectAtLocation Watch1 Drawer1)
    (objectAtLocation Laptop1 Desk1)
    (objectAtLocation CD1 GarbageCan1)
    (objectAtLocation CellPhone1 Desk2)
    (objectAtLocation Pencil1 Drawer2)
    (objectAtLocation CreditCard1 Drawer3)
    (objectAtLocation Laptop2 Sofa1)
    (objectAtLocation CD2 Desk3)
    (objectAtLocation Pillow1 Bed1)
    (objectAtLocation KeyChain1 Sofa1)
    (objectAtLocation Book1 Box2)
    (objectAtLocation Box2 Box3)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box3 Sofa1)
    (objectAtLocation Box4 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation Watch1 Sofa1)
      (objectAtLocation Book1 Sofa1)
      (not (objectAtLocation Watch1 Box3))
      (not (objectAtLocation Watch1 Box2))
      (not (objectAtLocation Book1 Box3))
      (not (objectAtLocation Book1 Box2))
    )
  )
)
