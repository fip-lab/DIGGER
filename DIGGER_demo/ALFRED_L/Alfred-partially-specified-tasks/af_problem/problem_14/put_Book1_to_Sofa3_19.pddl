(define (problem put_Book1_to_Sofa3_19)
  (:domain put_task)
  (:objects
agent1 - agent    Pillow1 - object
    CD1 - object
    Pencil2 - object
    Pencil1 - object
    Watch1 - object
    Book1 - object
    Pen1 - object
    Laptop1 - object
    Box1 - receptacle_object
    Box2 - receptacle_object
    CD2 - object
    Desk5 - receptacle
    Sofa1 - receptacle
    Drawer3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    KeyChain1 - object
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa2 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Bed1)
    (objectAtLocation Book1 Drawer1)
    (objectAtLocation Laptop1 Bed1)
    (objectAtLocation CD1 Drawer2)
    (objectAtLocation CD2 Desk1)
    (objectAtLocation Watch1 Desk2)
    (objectAtLocation Pencil1 Drawer3)
    (objectAtLocation Pen1 Desk4)
    (objectAtLocation Pillow1 Bed2)
    (objectAtLocation Pencil2 Desk5)
    (objectAtLocation KeyChain1 Box1)
    (objectAtLocation Box1 Box3)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box3 Sofa3)
    (objectAtLocation Box4 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation Book1 Sofa3)
      (objectAtLocation KeyChain1 Sofa3)
      (not (objectAtLocation Book1 Box3))
      (not (objectAtLocation Book1 Box1))
      (not (objectAtLocation KeyChain1 Box3))
      (not (objectAtLocation KeyChain1 Box1))
    )
  )
)
