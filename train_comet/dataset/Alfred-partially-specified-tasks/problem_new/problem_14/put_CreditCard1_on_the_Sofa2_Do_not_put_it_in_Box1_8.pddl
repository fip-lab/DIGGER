(define (problem put_CreditCard1_on_the_Sofa2_Do_not_put_it_in_Box1_8)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    Pen2 - object
    Pen3 - object
    CellPhone1 - object
    Watch1 - object
    Book1 - object
    CD2 - object
    Pen1 - object
    CreditCard1 - object
    CellPhone2 - object
    Box1 - receptacle_object
    Pencil1 - object
    CD1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Drawer3 - receptacle
    Sofa3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Bed2 - receptacle
    Desk2 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Drawer4 - receptacle
    GarbageCan1 - receptacle
    KeyChain1 - object
    Box2 - receptacle_object
    Box3 - receptacle_object
    Box4 - receptacle_object
  )

  (:init
    (atLocation agent1 Sofa1)
    (objectAtLocation CreditCard1 Drawer1)
    (objectAtLocation Book2 Sofa1)
    (objectAtLocation CD1 Drawer2)
    (objectAtLocation Pen1 Drawer3)
    (objectAtLocation Pen2 Desk1)
    (objectAtLocation CD2 Desk2)
    (objectAtLocation Watch1 Drawer4)
    (objectAtLocation CellPhone1 Sofa2)
    (objectAtLocation CellPhone2 Bed2)
    (objectAtLocation Pen3 GarbageCan1)
    (objectAtLocation KeyChain1 Sofa3)
    (objectAtLocation Book1 Box3)
    (objectAtLocation Box3 Box1)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box2 Sofa2)
    (objectAtLocation Box4 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation CreditCard1 Sofa2)
      (objectAtLocation Book1 Sofa2)
      (not (objectAtLocation CreditCard1 Box1))
      (not (objectAtLocation CreditCard1 Box3))
      (not (objectAtLocation Book1 Box1))
      (not (objectAtLocation Book1 Box3))
    )
  )
)
