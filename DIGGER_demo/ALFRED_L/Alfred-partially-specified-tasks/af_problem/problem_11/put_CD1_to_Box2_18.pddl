(define (problem put_CD1_to_Box2_18)
  (:domain put_task)
  (:objects
    agent1 - agent
    Book1 - object
    Pillow2 - object
    Watch1 - object
    CreditCard1 - object
    Box1 - receptacle
    Pencil2 - object
    Pencil1 - object
    CD1 - object
    CD2 - object
    Pillow1 - object
    Sofa2 - receptacle
    Drawer1 - receptacle
    Bed1 - receptacle
    Box2 - receptacle
    Desk2 - receptacle
    GarbageCan1 - receptacle
    Sofa1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    KeyChain1 - object
    KeyChain2 - object
    KeyChain3 - object
    KeyChain4 - object
    KeyChain5 - object
    KeyChain6 - object
    Box3 - receptacle
  )

  (:init
    (atLocation agent1 Desk2)
    (objectAtLocation CD1 GarbageCan1)
    (objectAtLocation Pencil1 Desk2)
    (objectAtLocation Pillow1 Sofa1)
    (objectAtLocation Book1 Bed1)
    (objectAtLocation CreditCard1 Sofa2)
    (objectAtLocation Pillow2 Bed2)
    (objectAtLocation Watch1 Drawer1)
    (objectAtLocation Pencil2 Desk2)
    (objectAtLocation KeyChain4 Box3)
    (objectAtLocation KeyChain3 Box2)
    (objectAtLocation KeyChain2 Box1)
    (objectAtLocation KeyChain1 Box3)
    (objectAtLocation KeyChain6 Box2)
    (objectAtLocation KeyChain5 Box2)
  )

  (:goal
    (and
      (objectAtLocation CD1 Box2)
    )
  )
)
