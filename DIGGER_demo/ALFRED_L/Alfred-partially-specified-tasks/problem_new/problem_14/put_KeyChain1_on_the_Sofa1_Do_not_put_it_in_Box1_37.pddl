(define (problem put_KeyChain1_on_the_Sofa1_Do_not_put_it_in_Box1_37)
  (:domain put_task)
  (:objects
agent1 - agent    Box2 - receptacle_object
    KeyChain2 - object
    KeyChain1 - object
    Watch1 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    KeyChain3 - object
    Box1 - receptacle_object
    CreditCard2 - object
    Pencil1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Sofa3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Sofa4 - receptacle
    Desk3 - receptacle
    Desk1 - receptacle
    Box3 - receptacle_object
    Box4 - receptacle_object
  )

  (:init
    (atLocation agent1 Desk1)
    (objectAtLocation KeyChain1 Sofa1)
    (objectAtLocation Watch1 Desk1)
    (objectAtLocation KeyChain2 Drawer1)
    (objectAtLocation Pen1 Drawer2)
    (objectAtLocation CreditCard2 Sofa4)
    (objectAtLocation Pencil1 Desk2)
    (objectAtLocation Book1 Box3)
    (objectAtLocation Box3 Box1)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box4 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation KeyChain1 Sofa1)
      (objectAtLocation Book1 Sofa1)
      (not (objectAtLocation KeyChain1 Box1))
      (not (objectAtLocation KeyChain1 Box3))
      (not (objectAtLocation Book1 Box1))
      (not (objectAtLocation Book1 Box3))
    )
  )
)
