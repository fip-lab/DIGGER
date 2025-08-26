(define (problem put_CellPhone1_on_the_Sofa1_Do_not_put_it_in_Box3_18)
  (:domain put_task)
  (:objects
agent1 - agent    Pen2 - object
    Pillow1 - object
    CellPhone3 - object
    CD1 - object
    Pencil2 - object
    Watch1 - object
    KeyChain1 - object
    CreditCard2 - object
    Pen1 - object
    CreditCard1 - object
    CellPhone2 - object
    Box1 - receptacle_object
    Pencil1 - object
    CellPhone1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Drawer3 - receptacle
    Drawer5 - receptacle
    Sofa3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Drawer6 - receptacle
    Drawer4 - receptacle
    Box2 - receptacle_object
    Box3 - receptacle_object
    Box4 - receptacle_object
  )

  (:init
    (atLocation agent1 Drawer2)
    (objectAtLocation CellPhone1 Drawer1)
    (objectAtLocation Watch1 Drawer2)
    (objectAtLocation CreditCard1 Drawer4)
    (objectAtLocation Pencil1 Desk1)
    (objectAtLocation Pillow1 Sofa2)
    (objectAtLocation CellPhone2 Desk2)
    (objectAtLocation Pen2 Drawer5)
    (objectAtLocation CellPhone3 Bed1)
    (objectAtLocation CreditCard2 Sofa3)
    (objectAtLocation Pencil2 Drawer6)
    (objectAtLocation KeyChain1 Box1)
    (objectAtLocation Box1 Box3)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box3 Sofa1)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation CellPhone1 Sofa1)
      (objectAtLocation KeyChain1 Sofa1)
      (not (objectAtLocation CellPhone1 Box3))
      (not (objectAtLocation CellPhone1 Box1))
      (not (objectAtLocation KeyChain1 Box3))
      (not (objectAtLocation KeyChain1 Box1))
    )
  )
)
