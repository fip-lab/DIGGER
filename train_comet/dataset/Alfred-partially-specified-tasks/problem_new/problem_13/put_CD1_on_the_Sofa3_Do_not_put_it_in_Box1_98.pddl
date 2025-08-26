(define (problem put_CD1_on_the_Sofa3_Do_not_put_it_in_Box1_98)
  (:domain put_task)
  (:objects
    agent1 - agent
    Pen1 - object
    Box2 - receptacle
    KeyChain3 - object
    CellPhone1 - object
    Laptop1 - object
    Watch1 - object
    KeyChain1 - object
    Book2 - object
    CD1 - object
    Book1 - object
    KeyChain2 - object
    CellPhone2 - object
    CellPhone3 - object
    Box1 - receptacle
    Pillow1 - object
    Desk1 - receptacle
    Bed1 - receptacle
    Desk3 - receptacle
    Bed2 - receptacle
    Bed3 - receptacle
    Sofa3 - receptacle
    Drawer2 - receptacle
    Drawer3 - receptacle
    Drawer4 - receptacle
    Sofa1 - receptacle
    Bed4 - receptacle
    Drawer1 - receptacle
    Desk2 - receptacle
    Sofa2 - receptacle
    Book3 - object
    Book4 - object
    Box3 - receptacle
    Box4 - receptacle
  )

  (:init
    (atLocation agent1 Desk1)
    (objectAtLocation CD1 Drawer1)
    (objectAtLocation Watch1 Desk1)
    (objectAtLocation CellPhone1 Desk2)
    (objectAtLocation Laptop1 Bed1)
    (objectAtLocation KeyChain1 Drawer2)
    (objectAtLocation Book1 Bed2)
    (objectAtLocation Pen1 Drawer3)
    (objectAtLocation Pillow1 Bed3)
    (objectAtLocation Book2 Drawer4)
    (objectAtLocation KeyChain3 Sofa2)
    (objectAtLocation CellPhone2 Bed4)
    (objectAtLocation CellPhone3 Sofa3)
    (objectAtLocation Book3 Bed2)
    (objectAtLocation KeyChain2 Drawer3)
    (objectAtLocation Book4 Box1)
    (objectAtLocation Box1 Sofa3)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box3 Sofa1)
    (objectAtLocation Box4 Sofa3)
  )

  (:goal
    (and
      (objectAtLocation CD1 Sofa3)
      (not (objectAtLocation CD1 Box1))
    )
  )
)
